namespace :createdb do
  desc "create some articles"
  task articles: :environment do
    admin = User.create(name: "admin", email: "admin@admin.com", passowrd: "adminadmin")
    (1..100).each do |num|
      s = num.to_s
      ss = s*50
      Article.create!(title: "Article #{num}", text: "Text of Article #{num} + #{ss}", user_id: admin.id)
    end
  end

end
