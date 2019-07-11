FactoryBot.define do
  factory :round do
    winner { ["Red","Green","Black"].sample }
    # Game doesn't need any param, it's automatically filled by DB default attributes
  end
end
