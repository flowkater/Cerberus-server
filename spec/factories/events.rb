# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    tag_name "MyString"
    project nil
  end
end
