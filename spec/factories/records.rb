# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :record do
    type ""
    view "MyString"
    param 1
    scenario nil
  end
end
