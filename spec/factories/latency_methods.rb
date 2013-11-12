# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :latency_method do
    latency 1.5
    name "MyString"
    class_name "MyString"
    line_number "MyString"
    request_url "MyString"
    network nil
  end
end
