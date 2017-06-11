FactoryGirl.define do
  factory :secret do
    content "This is a secret!!!"
    user
  end
end
