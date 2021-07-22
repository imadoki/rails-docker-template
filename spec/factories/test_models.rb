# frozen_string_literal: true

FactoryBot.define do
  factory :test_model do
    sequence :name do |n|
      "sample#{n}"
    end
  end
end
