# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_170_505_063_918) do
  create_table 'article_bases', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'title', null: false
    t.text 'content', null: false
    t.text 'description', null: false
    t.integer 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['title'], name: 'index_article_bases_on_title'
    t.index ['user_id'], name: 'index_article_bases_on_user_id'
  end

  create_table 'article_comments', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'article_id', null: false
    t.integer 'user_id', null: false
    t.text 'text', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[article_id user_id], name: 'index_article_comments_on_article_id_and_user_id'
    t.index ['article_id'], name: 'index_article_comments_on_article_id'
    t.index ['user_id'], name: 'index_article_comments_on_user_id'
  end

  create_table 'article_photos', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'article_id', null: false
    t.boolean 'removed', default: true
    t.string 'image', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['article_id'], name: 'index_article_photos_on_article_id'
  end

  create_table 'article_tags', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_article_tags_on_name', unique: true
  end

  create_table 'chat_chat_rooms', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_chat_chat_rooms_on_name'
  end

  create_table 'chat_messages', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.text 'text', null: false
    t.integer 'user_id', null: false
    t.integer 'chat_room_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[chat_room_id user_id], name: 'index_chat_messages_on_chat_room_id_and_user_id'
    t.index ['chat_room_id'], name: 'chat_room_id'
    t.index ['user_id'], name: 'user_id'
  end

  create_table 'intermediate_table_article_favorites', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'user_id', null: false
    t.integer 'article_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['article_id'], name: 'article_favorites_article_id'
    t.index %w[user_id article_id], name: 'article_favorites_unique', unique: true
    t.index ['user_id'], name: 'article_favorites_user_id'
  end

  create_table 'intermediate_table_article_tag_relations', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'tag_id', null: false
    t.integer 'article_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['article_id'], name: 'article_tag_relations_article_id'
    t.index %w[tag_id article_id], name: 'article_tag_relations_unique', unique: true
    t.index ['tag_id'], name: 'article_tag_relations_tag_id'
  end

  create_table 'intermediate_table_chat_room_user_relations', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'user_id', null: false
    t.integer 'chat_room_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['chat_room_id'], name: 'chat_room_id'
    t.index %w[user_id chat_room_id], name: 'chat_room_user_unique', unique: true
    t.index ['user_id'], name: 'user_id'
  end

  create_table 'intermediate_table_user_relationships', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'follower_id', null: false
    t.integer 'following_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[follower_id following_id], name: 'user_relationships_unique', unique: true
    t.index ['follower_id'], name: 'user_relationships_follower_id'
    t.index ['following_id'], name: 'user_relationships_following_id'
  end

  create_table 'user_bases', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name', default: 'Guest', null: false
    t.string 'email', null: false
    t.text 'sentence'
    t.string 'image'
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.integer 'failed_attempts', default: 0, null: false
    t.string 'unlock_token'
    t.datetime 'locked_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['confirmation_token'], name: 'index_user_bases_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_user_bases_on_email', unique: true
    t.index ['name'], name: 'index_user_bases_on_name', unique: true
    t.index ['reset_password_token'], name: 'index_user_bases_on_reset_password_token', unique: true
    t.index ['unlock_token'], name: 'index_user_bases_on_unlock_token', unique: true
  end
end
