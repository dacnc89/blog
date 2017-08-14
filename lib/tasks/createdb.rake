namespace :createdb do
  desc "create some articles"
  task articles: :environment do
    (1..100).each do |num|
      s = num.to_s
      ss = s*50
      Article.create!(title: "Article #{num}", text: "Text of Article #{num} + #{ss}")
    end
  end

end
