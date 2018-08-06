class BlogMailer < ApplicationMailer
  def blog_mail(blog)
  @blog = blog

 mail to: "sumiko_saito@diveintocode.jp", subject: "ブログ作成の確認メール"
end
end
