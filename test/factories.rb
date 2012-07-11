FactoryGirl.define do
  factory :article do
    sequence(:title){|n| "Tytul #{n}"}
    sequence(:summary){|n| "Wstep #{n}"}
    sequence(:body){|n| "Tresc #{n}"}
    tag_list "Tresc, Factory"
    category
  end

  factory :comment do
    body "text"
    article
    user
  end

  factory :user do
    sequence(:email){|n| "factory#{n}@factory.com"}
    password "factory"
    password_confirmation "factory"
  end

  factory :category do
    title "Nazwa"
  end

end