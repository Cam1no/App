FactoryGirl.define do
  factory :article_photo, class: 'Article::Photo' do
    article_id 1
    removed false
    image_path "MyString"
    image "MyString"
  end
end
