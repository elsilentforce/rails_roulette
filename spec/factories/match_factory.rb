FactoryBot.define do
  factory :match do
    association :user, factory: :user, strategy: :build
    association :game, factory: :game, strategy: :build
    bet { rand(1..10000) }
  end
end
