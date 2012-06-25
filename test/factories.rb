FactoryGirl.define do
  factory :article do
    title "Sample"
    body "text"
    summary "extra"
    category
  end

  factory :comment do
    body "text"
    article
    user
  end

  factory :user do
    email "factory@factory.com"
    password "factory"
    password_confirmation "factory"
  end

  factory :category do
    title "Nazwa"
  end

  factory :tag do
    title "Nazwa"
  end
end