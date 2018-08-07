class BlogMailer < ApplicationMailer
  def blog_mail(blog)
    @blog = blog

    mail subject: "ブログ作成の確認メール"
  end
end
