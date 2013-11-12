# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trace_method do
    name "MyString"
    self_time_rate 1.5
    sum_time_rate 1.5
    usecs 1.5
    cpu nil
  end
end
