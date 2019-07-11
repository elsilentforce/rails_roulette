FactoryBot.define do
  factory :bet do
    association :user, factory: :user, strategy: :build
    association :round, factory: :round, strategy: :build
    bet { rand(1..10000) }
    target { ["Red","Green","Black"].sample }
  end
end
