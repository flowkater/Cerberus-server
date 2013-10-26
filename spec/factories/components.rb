# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :component do
    name "MyString"
    joule "9.99"
    battery nil
  end
end
