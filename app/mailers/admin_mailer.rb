class AdminMailer < ApplicationMailer

  def article_submit_email(article)
    @article = article

    #users = User.all.select{|user| user.has_role? :admin}
    users = User.with_role(:admin)
    emails = users.map{|user| user.email}

    mail(to: emails, subject: 'nuovo articolo')

  end

end
