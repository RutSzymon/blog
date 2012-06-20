FactoryGirl.define do
  factory :article do
    title "Sample"
    body "text"
    summary "extra"
    association :category
  end
  factory :comment do
    body "text"
    article factory: :article
    user factory: :user
  end
  factory :user do
    email "factory@factory.com"
    password "factory"
    password_confirmation "factory"
  end
  factory :category do
    title "Nazwa"
  end
end