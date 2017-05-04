FactoryGirl.define do
  factory :intermediate_table_article_favorite, class: 'IntermediateTable::ArticleFavorite' do
    user_id 1
    article_id 1
  end
end
