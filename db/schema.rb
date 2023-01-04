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

ActiveRecord::Schema.define(version: 2023_01_03_103941) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "add_networks", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "applies", force: :cascade do |t|
    t.string "cv"
    t.integer "job_navigation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_navigation_id"], name: "index_applies_on_job_navigation_id"
  end

  create_table "apply_jobs", force: :cascade do |t|
    t.string "cvv", null: false
    t.integer "user_id", null: false
    t.integer "job_navigation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_navigation_id"], name: "index_apply_jobs_on_job_navigation_id"
    t.index ["user_id"], name: "index_apply_jobs_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "room_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_chats_on_room_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "comment_posts", force: :cascade do |t|
    t.string "body", null: false
    t.integer "job_navigation_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_navigation_id"], name: "index_comment_posts_on_job_navigation_id"
    t.index ["user_id"], name: "index_comment_posts_on_user_id"
  end

  create_table "connections", force: :cascade do |t|
    t.integer "connecting_id"
    t.integer "connector_id"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["connecting_id"], name: "index_connections_on_connecting_id"
    t.index ["connector_id"], name: "index_connections_on_connector_id"
    t.index ["user_id", "created_at"], name: "index_connections_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_connections_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "followability_relationships", force: :cascade do |t|
    t.string "followerable_type", null: false
    t.integer "followerable_id", null: false
    t.string "followable_type", null: false
    t.integer "followable_id", null: false
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followable_type", "followable_id"], name: "index_followability_relationships_on_followable"
    t.index ["followerable_type", "followerable_id"], name: "index_followability_relationships_on_followerable"
  end

  create_table "followers", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "following_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["follower_id"], name: "index_followers_on_follower_id"
    t.index ["following_id"], name: "index_followers_on_following_id"
    t.index ["user_id"], name: "index_followers_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friends", force: :cascade do |t|
    t.integer "sending_id"
    t.integer "sender_id"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sender_id"], name: "index_friends_on_sender_id"
    t.index ["sending_id"], name: "index_friends_on_sending_id"
    t.index ["user_id", "created_at"], name: "index_friends_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_friends_on_user_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.string "cv"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_fields", force: :cascade do |t|
    t.string "jobsection"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_navbars", force: :cascade do |t|
    t.string "jobtitle"
    t.string "jobdescription"
    t.string "novac"
    t.string "skill"
    t.string "jobrole"
    t.string "jobsector"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_job_navbars_on_user_id"
  end

  create_table "job_navigations", force: :cascade do |t|
    t.string "jobtitle"
    t.string "jobdescription"
    t.string "novac"
    t.string "skill"
    t.string "jobrole"
    t.string "jobsector"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_approved", default: false
    t.index ["user_id", "created_at"], name: "index_job_navigations_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_job_navigations_on_user_id"
  end

  create_table "job_positions", force: :cascade do |t|
    t.string "jobdesignation", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "jobrole"
    t.string "jobsector"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "participants", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_participants_on_room_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "prof_link"
    t.string "qualification"
    t.string "experience"
    t.string "organisation"
    t.string "skills"
    t.string "job_role"
    t.string "notification"
    t.string "cv"
    t.string "image"
    t.string "certificates"
    t.boolean "exist", default: false
    t.boolean "boolean", default: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "created_at"], name: "index_profiles_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "reviewer"
    t.text "body"
    t.integer "job_navigation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_navigation_id"], name: "index_reviews_on_job_navigation_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.boolean "is_private"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "private", default: false
  end

  create_table "texts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_texts_on_user_id"
  end

  create_table "triels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.string "username"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "applies", "job_navigations"
  add_foreign_key "apply_jobs", "job_navigations"
  add_foreign_key "apply_jobs", "users"
  add_foreign_key "chats", "rooms"
  add_foreign_key "chats", "users"
  add_foreign_key "comment_posts", "job_navigations"
  add_foreign_key "comment_posts", "users"
  add_foreign_key "connections", "users"
  add_foreign_key "friends", "users"
  add_foreign_key "job_navbars", "users"
  add_foreign_key "job_navigations", "users"
  add_foreign_key "participants", "rooms"
  add_foreign_key "participants", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "job_navigations"
  add_foreign_key "texts", "users"
end
