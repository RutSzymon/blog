FactoryGirl.define do
  factory :article do
    title "Sample"
    body "text"
    summary "extra"
  end
  factory :comment do
    body "text"
    article factory: :article
  end
end