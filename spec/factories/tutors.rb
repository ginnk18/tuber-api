FactoryGirl.define do
  factory :tutor do
    education "MyText"
    experience "MyText"
    email "MyString"
    phone 1
    hours "MyString"
    rate_cents 1
    current_location "MyString"
    is_available false
    subjects "MyString"
    password_hash "MyString"
  end
end
