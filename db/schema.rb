# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_220_520_035_843) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'articles', force: :cascade do |t|
    t.string 'title'
    t.text 'body'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'status'
    t.integer 'user_id'
    t.index ['user_id'], name: 'index_articles_on_user_id'
  end

  create_table 'comments', force: :cascade do |t|
    t.string 'commenter'
    t.text 'body'
    t.bigint 'article_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'status'
    t.bigint 'user_id', null: false
    t.index ['article_id'], name: 'index_comments_on_article_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'follows', force: :cascade do |t|
    t.string 'followable_type', null: false
    t.bigint 'followable_id', null: false
    t.string 'follower_type', null: false
    t.bigint 'follower_id', null: false
    t.boolean 'blocked', default: false, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[followable_id followable_type], name: 'fk_followables'
    t.index %w[followable_type followable_id], name: 'index_follows_on_followable'
    t.index %w[follower_id follower_type], name: 'fk_follows'
    t.index %w[follower_type follower_id], name: 'index_follows_on_follower'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'comments', 'articles'
  add_foreign_key 'comments', 'users'
end
