require 'digest/sha1'

class Author < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  
  include MovableType
  

  validates_presence_of     :author_name
  validates_length_of       :author_name,    :within => 3..40
  validates_uniqueness_of   :author_name
  validates_format_of       :author_name,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :author_nickname,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :author_nickname,     :maximum => 100

  validates_presence_of     :author_email
  validates_length_of       :author_email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :author_email
  validates_format_of       :author_email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message
  
  named_scope :active, :conditions => { :author_status => 1 }
  has_many :entries, :foreign_key => 'entry_author_id'
  has_many :author_metas, :foreign_key => 'author_meta_author_id'
  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation
  alias_attribute :crypted_password, :author_password



  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = self.active.find :first, :conditions => ["author_name = ? or author_email = ?", login.downcase, login.downcase ] # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end
  
  def remember_token
    meta = author_metas.find(:first, :conditions => { :author_meta_type => 'remember_token' })
    meta ? meta.author_meta_vchar : nil
  end
  
  def remember_token=(tokenval)
    token = author_metas.find(:first, :conditions => { :author_meta_type => 'remember_token' })
    if token
      token.author_meta_vchar = tokenval
      token.save
    else
      AuthorMeta.create(:author_meta_author_id => self.id, :author_meta_type => 'remember_token', :author_meta_vchar => tokenval)
    end
  end
  
  def remember_token?
    remember_token ? true : false
  end
  
  def remember_token_expires_at
    meta = author_metas.find(:first, :conditions => { :author_meta_type => 'remember_token_expires_at' })
    meta ? meta.author_meta_vdatetime : nil
  end
  
  def remember_token_expires_at=(expiresat)
    token = author_metas.find(:first, :conditions => { :author_meta_type => 'remember_token_expires_at' })
    if token
      token.author_meta_vdatetime = expiresat
      token.save
    else
      AuthorMeta.create(:author_meta_author_id => self.id, :author_meta_type => 'remember_token_expires_at', :author_meta_vdatetime => expiresat)
    end
  end
  
  def remember_token_expires_at?
    remember_token_expires_at ? true : false
  end
  
  def self.find_by_remember_token(tokenval)
    authormeta = AuthorMeta.find(:first, :conditions => { :author_meta_type => 'remember_token', :author_meta_vchar => tokenval })
    if authormeta
      return find(authormeta.author_meta_author_id)
    else
      return nil
    end
  end
  
  def self.find_by_id(id)
    find_by_author_id(id)
  end 
  

  protected
    
  def make_activation_code
      self.deleted_at = nil
      self.activation_code = self.class.make_token
  end


end
