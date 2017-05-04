FactoryGirl.define do
  factory :intermediate_table_user_relationship, class: 'IntermediateTable::UserRelationship' do
    follower_id 1
    following_id 1
  end
end
