FactoryBot.define do
  factory :post do
    information {'Some Rationale'}
    user
  end

  factory :second_post, class: "Post" do
    information {'Some more content'}
    user
  end
end
