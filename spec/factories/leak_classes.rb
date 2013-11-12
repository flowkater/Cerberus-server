# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :leak_class do
    classname "MyString"
    differencecnt 1
    totalsize 1
    memory nil
  end
end
