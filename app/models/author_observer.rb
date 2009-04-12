class AuthorObserver < ActiveRecord::Observer
  def after_create(author)
    AuthorMailer.deliver_signup_notification(author)
  end

  def after_save(author)
  
    AuthorMailer.deliver_activation(author) if author.recently_activated?
  
  end
end
