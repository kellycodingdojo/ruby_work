FactoryGirl.define do
  factory :message do
    message "This is a message that is long enough to be valid."
    user
  end
end
