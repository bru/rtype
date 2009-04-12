# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

# Be sure to include AuthenticatedTestHelper in spec/spec_helper.rb instead.
# Then, you can remove it from this and the functional test.
include AuthenticatedTestHelper

describe Author do
  fixtures :authors

  describe 'being created' do
    before do
      @author = nil
      @creating_author = lambda do
        @author = create_author
        violated "#{@author.errors.full_messages.to_sentence}" if @author.new_record?
      end
    end

    it 'increments Author#count' do
      @creating_author.should change(Author, :count).by(1)
    end

    it 'initializes #activation_code' do
      @creating_author.call
      @author.reload
      @author.activation_code.should_not be_nil
    end

    it 'starts in pending state' do
      @creating_author.call
      @author.reload
      @author.should be_pending
    end
  end

  #
  # Validations
  #

  it 'requires login' do
    lambda do
      u = create_author(:login => nil)
      u.errors.on(:login).should_not be_nil
    end.should_not change(Author, :count)
  end

  describe 'allows legitimate logins:' do
    ['123', '1234567890_234567890_234567890_234567890',
     'hello.-_there@funnychar.com'].each do |login_str|
      it "'#{login_str}'" do
        lambda do
          u = create_author(:login => login_str)
          u.errors.on(:login).should     be_nil
        end.should change(Author, :count).by(1)
      end
    end
  end
  describe 'disallows illegitimate logins:' do
    ['12', '1234567890_234567890_234567890_234567890_', "tab\t", "newline\n",
     "Iñtërnâtiônàlizætiøn hasn't happened to ruby 1.8 yet",
     'semicolon;', 'quote"', 'tick\'', 'backtick`', 'percent%', 'plus+', 'space '].each do |login_str|
      it "'#{login_str}'" do
        lambda do
          u = create_author(:login => login_str)
          u.errors.on(:login).should_not be_nil
        end.should_not change(Author, :count)
      end
    end
  end

  it 'requires password' do
    lambda do
      u = create_author(:password => nil)
      u.errors.on(:password).should_not be_nil
    end.should_not change(Author, :count)
  end

  it 'requires password confirmation' do
    lambda do
      u = create_author(:password_confirmation => nil)
      u.errors.on(:password_confirmation).should_not be_nil
    end.should_not change(Author, :count)
  end

  it 'requires email' do
    lambda do
      u = create_author(:email => nil)
      u.errors.on(:email).should_not be_nil
    end.should_not change(Author, :count)
  end

  describe 'allows legitimate emails:' do
    ['foo@bar.com', 'foo@newskool-tld.museum', 'foo@twoletter-tld.de', 'foo@nonexistant-tld.qq',
     'r@a.wk', '1234567890-234567890-234567890-234567890-234567890-234567890-234567890-234567890-234567890@gmail.com',
     'hello.-_there@funnychar.com', 'uucp%addr@gmail.com', 'hello+routing-str@gmail.com',
     'domain@can.haz.many.sub.doma.in', 'student.name@university.edu'
    ].each do |email_str|
      it "'#{email_str}'" do
        lambda do
          u = create_author(:email => email_str)
          u.errors.on(:email).should     be_nil
        end.should change(Author, :count).by(1)
      end
    end
  end
  describe 'disallows illegitimate emails' do
    ['!!@nobadchars.com', 'foo@no-rep-dots..com', 'foo@badtld.xxx', 'foo@toolongtld.abcdefg',
     'Iñtërnâtiônàlizætiøn@hasnt.happened.to.email', 'need.domain.and.tld@de', "tab\t", "newline\n",
     'r@.wk', '1234567890-234567890-234567890-234567890-234567890-234567890-234567890-234567890-234567890@gmail2.com',
     # these are technically allowed but not seen in practice:
     'uucp!addr@gmail.com', 'semicolon;@gmail.com', 'quote"@gmail.com', 'tick\'@gmail.com', 'backtick`@gmail.com', 'space @gmail.com', 'bracket<@gmail.com', 'bracket>@gmail.com'
    ].each do |email_str|
      it "'#{email_str}'" do
        lambda do
          u = create_author(:email => email_str)
          u.errors.on(:email).should_not be_nil
        end.should_not change(Author, :count)
      end
    end
  end

  describe 'allows legitimate names:' do
    ['Andre The Giant (7\'4", 520 lb.) -- has a posse',
     '', '1234567890_234567890_234567890_234567890_234567890_234567890_234567890_234567890_234567890_234567890',
    ].each do |name_str|
      it "'#{name_str}'" do
        lambda do
          u = create_author(:name => name_str)
          u.errors.on(:name).should     be_nil
        end.should change(Author, :count).by(1)
      end
    end
  end
  describe "disallows illegitimate names" do
    ["tab\t", "newline\n",
     '1234567890_234567890_234567890_234567890_234567890_234567890_234567890_234567890_234567890_234567890_',
     ].each do |name_str|
      it "'#{name_str}'" do
        lambda do
          u = create_author(:name => name_str)
          u.errors.on(:name).should_not be_nil
        end.should_not change(Author, :count)
      end
    end
  end

  it 'resets password' do
    authors(:quentin).update_attributes(:password => 'new password', :password_confirmation => 'new password')
    Author.authenticate('quentin', 'new password').should == authors(:quentin)
  end

  it 'does not rehash password' do
    authors(:quentin).update_attributes(:login => 'quentin2')
    Author.authenticate('quentin2', 'monkey').should == authors(:quentin)
  end

  #
  # Authentication
  #

  it 'authenticates author' do
    Author.authenticate('quentin', 'monkey').should == authors(:quentin)
  end

  it "doesn't authenticate author with bad password" do
    Author.authenticate('quentin', 'invalid_password').should be_nil
  end

 if REST_AUTH_SITE_KEY.blank?
   # old-school passwords
   it "authenticates a user against a hard-coded old-style password" do
     Author.authenticate('old_password_holder', 'test').should == authors(:old_password_holder)
   end
 else
   it "doesn't authenticate a user against a hard-coded old-style password" do
     Author.authenticate('old_password_holder', 'test').should be_nil
   end

   # New installs should bump this up and set REST_AUTH_DIGEST_STRETCHES to give a 10ms encrypt time or so
   desired_encryption_expensiveness_ms = 0.1
   it "takes longer than #{desired_encryption_expensiveness_ms}ms to encrypt a password" do
     test_reps = 100
     start_time = Time.now; test_reps.times{ Author.authenticate('quentin', 'monkey'+rand.to_s) }; end_time   = Time.now
     auth_time_ms = 1000 * (end_time - start_time)/test_reps
     auth_time_ms.should > desired_encryption_expensiveness_ms
   end
 end

  #
  # Authentication
  #

  it 'sets remember token' do
    authors(:quentin).remember_me
    authors(:quentin).remember_token.should_not be_nil
    authors(:quentin).remember_token_expires_at.should_not be_nil
  end

  it 'unsets remember token' do
    authors(:quentin).remember_me
    authors(:quentin).remember_token.should_not be_nil
    authors(:quentin).forget_me
    authors(:quentin).remember_token.should be_nil
  end

  it 'remembers me for one week' do
    before = 1.week.from_now.utc
    authors(:quentin).remember_me_for 1.week
    after = 1.week.from_now.utc
    authors(:quentin).remember_token.should_not be_nil
    authors(:quentin).remember_token_expires_at.should_not be_nil
    authors(:quentin).remember_token_expires_at.between?(before, after).should be_true
  end

  it 'remembers me until one week' do
    time = 1.week.from_now.utc
    authors(:quentin).remember_me_until time
    authors(:quentin).remember_token.should_not be_nil
    authors(:quentin).remember_token_expires_at.should_not be_nil
    authors(:quentin).remember_token_expires_at.should == time
  end

  it 'remembers me default two weeks' do
    before = 2.weeks.from_now.utc
    authors(:quentin).remember_me
    after = 2.weeks.from_now.utc
    authors(:quentin).remember_token.should_not be_nil
    authors(:quentin).remember_token_expires_at.should_not be_nil
    authors(:quentin).remember_token_expires_at.between?(before, after).should be_true
  end

  it 'registers passive author' do
    author = create_author(:password => nil, :password_confirmation => nil)
    author.should be_passive
    author.update_attributes(:password => 'new password', :password_confirmation => 'new password')
    author.register!
    author.should be_pending
  end

  it 'suspends author' do
    authors(:quentin).suspend!
    authors(:quentin).should be_suspended
  end

  it 'does not authenticate suspended author' do
    authors(:quentin).suspend!
    Author.authenticate('quentin', 'monkey').should_not == authors(:quentin)
  end

  it 'deletes author' do
    authors(:quentin).deleted_at.should be_nil
    authors(:quentin).delete!
    authors(:quentin).deleted_at.should_not be_nil
    authors(:quentin).should be_deleted
  end

  describe "being unsuspended" do
    fixtures :authors

    before do
      @author = authors(:quentin)
      @author.suspend!
    end

    it 'reverts to active state' do
      @author.unsuspend!
      @author.should be_active
    end

    it 'reverts to passive state if activation_code and activated_at are nil' do
      Author.update_all :activation_code => nil, :activated_at => nil
      @author.reload.unsuspend!
      @author.should be_passive
    end

    it 'reverts to pending state if activation_code is set and activated_at is nil' do
      Author.update_all :activation_code => 'foo-bar', :activated_at => nil
      @author.reload.unsuspend!
      @author.should be_pending
    end
  end

protected
  def create_author(options = {})
    record = Author.new({ :login => 'quire', :email => 'quire@example.com', :password => 'quire69', :password_confirmation => 'quire69' }.merge(options))
    record.register! if record.valid?
    record
  end
end
