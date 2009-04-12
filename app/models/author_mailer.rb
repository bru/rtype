class AuthorMailer < ActionMailer::Base
  def signup_notification(author)
    setup_email(author)
    @subject    += 'Please activate your new account'
  
    @body[:url]  = "http://YOURSITE/activate/#{author.activation_code}"
  
  end
  
  def activation(author)
    setup_email(author)
    @subject    += 'Your account has been activated!'
    @body[:url]  = "http://YOURSITE/"
  end
  
  protected
    def setup_email(author)
      @recipients  = "#{author.email}"
      @from        = "ADMINEMAIL"
      @subject     = "[YOURSITE] "
      @sent_on     = Time.now
      @body[:author] = author
    end
end
