# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { 'title' }
    body { 'it is new article' }
    status { 'public' }
  end
end
