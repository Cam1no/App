FactoryGirl.define do
  factory :article_comment, class: 'Article::Comment' do
    article_id ""
    user_id ""
    text "MyText"
  end
end
