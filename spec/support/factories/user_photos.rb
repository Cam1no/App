FactoryGirl.define do
  factory :user_photo, class: 'User::Photo' do
    user_id 1
    removed false
    image_path "MyString"
    image "MyString"
  end
end
