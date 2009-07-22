# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090312142805) do

  create_table "author_meta", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mt_as_ua_cache", :primary_key => "as_ua_cache_id", :force => true do |t|
    t.string "as_ua_cache_action_type",   :null => false
    t.string "as_ua_cache_etag"
    t.string "as_ua_cache_last_modified"
    t.string "as_ua_cache_url",           :null => false
  end

  add_index "mt_as_ua_cache", ["as_ua_cache_url", "as_ua_cache_action_type"], :name => "mt_as_ua_cache_url_type"

  create_table "mt_asset", :primary_key => "asset_id", :force => true do |t|
    t.integer  "asset_blog_id",                                             :null => false
    t.string   "asset_class",                           :default => "file"
    t.integer  "asset_created_by"
    t.datetime "asset_created_on"
    t.text     "asset_description", :limit => 16777215
    t.string   "asset_file_ext",    :limit => 20
    t.string   "asset_file_name"
    t.string   "asset_file_path"
    t.string   "asset_label"
    t.string   "asset_mime_type"
    t.integer  "asset_modified_by"
    t.datetime "asset_modified_on"
    t.integer  "asset_parent"
    t.string   "asset_url"
  end

  add_index "mt_asset", ["asset_blog_id", "asset_class", "asset_created_on"], :name => "mt_asset_blog_class_date"
  add_index "mt_asset", ["asset_class"], :name => "mt_asset_class"
  add_index "mt_asset", ["asset_created_by"], :name => "mt_asset_created_by"
  add_index "mt_asset", ["asset_created_on"], :name => "mt_asset_created_on"
  add_index "mt_asset", ["asset_file_ext"], :name => "mt_asset_file_ext"
  add_index "mt_asset", ["asset_label"], :name => "mt_asset_label"
  add_index "mt_asset", ["asset_parent"], :name => "mt_asset_parent"

  create_table "mt_asset_meta", :id => false, :force => true do |t|
    t.integer  "asset_meta_asset_id",                          :null => false
    t.string   "asset_meta_type",          :limit => 75,       :null => false
    t.string   "asset_meta_vchar"
    t.string   "asset_meta_vchar_idx"
    t.datetime "asset_meta_vdatetime"
    t.datetime "asset_meta_vdatetime_idx"
    t.integer  "asset_meta_vinteger"
    t.integer  "asset_meta_vinteger_idx"
    t.float    "asset_meta_vfloat"
    t.float    "asset_meta_vfloat_idx"
    t.binary   "asset_meta_vblob",         :limit => 16777215
    t.text     "asset_meta_vclob",         :limit => 16777215
  end

  add_index "mt_asset_meta", ["asset_meta_type", "asset_meta_vchar_idx"], :name => "mt_asset_meta_type_vchar"
  add_index "mt_asset_meta", ["asset_meta_type", "asset_meta_vdatetime_idx"], :name => "mt_asset_meta_type_vdt"
  add_index "mt_asset_meta", ["asset_meta_type", "asset_meta_vfloat_idx"], :name => "mt_asset_meta_type_vflt"
  add_index "mt_asset_meta", ["asset_meta_type", "asset_meta_vinteger_idx"], :name => "mt_asset_meta_type_vint"

  create_table "mt_association", :primary_key => "association_id", :force => true do |t|
    t.integer  "association_author_id",   :default => 0
    t.integer  "association_blog_id",     :default => 0
    t.integer  "association_created_by"
    t.datetime "association_created_on"
    t.integer  "association_group_id",    :default => 0
    t.integer  "association_modified_by"
    t.datetime "association_modified_on"
    t.integer  "association_role_id",     :default => 0
    t.integer  "association_type",                       :null => false
  end

  add_index "mt_association", ["association_author_id"], :name => "mt_association_author_id"
  add_index "mt_association", ["association_blog_id"], :name => "mt_association_blog_id"
  add_index "mt_association", ["association_created_on"], :name => "mt_association_created_on"
  add_index "mt_association", ["association_group_id"], :name => "mt_association_group_id"
  add_index "mt_association", ["association_role_id"], :name => "mt_association_role_id"
  add_index "mt_association", ["association_type"], :name => "mt_association_type"

  create_table "mt_author", :primary_key => "author_id", :force => true do |t|
    t.string   "author_api_password",         :limit => 60
    t.string   "author_auth_type",            :limit => 50
    t.string   "author_basename"
    t.integer  "author_can_create_blog",      :limit => 1
    t.integer  "author_can_view_log",         :limit => 1
    t.integer  "author_created_by"
    t.datetime "author_created_on"
    t.string   "author_email",                :limit => 75
    t.string   "author_entry_prefs"
    t.string   "author_external_id"
    t.string   "author_hint",                 :limit => 75
    t.integer  "author_is_superuser",         :limit => 1
    t.integer  "author_modified_by"
    t.datetime "author_modified_on"
    t.string   "author_name",                                                    :null => false
    t.string   "author_nickname"
    t.string   "author_password",             :limit => 60,                      :null => false
    t.string   "author_preferred_language",   :limit => 50
    t.text     "author_public_key",           :limit => 16777215
    t.string   "author_remote_auth_token",    :limit => 50
    t.string   "author_remote_auth_username", :limit => 50
    t.integer  "author_status",                                   :default => 1
    t.string   "author_text_format",          :limit => 30
    t.integer  "author_type",                 :limit => 2,        :default => 1, :null => false
    t.string   "author_url"
    t.integer  "author_userpic_asset_id"
  end

  add_index "mt_author", ["author_auth_type", "author_name", "author_type"], :name => "mt_author_auth_type_name"
  add_index "mt_author", ["author_basename"], :name => "mt_author_basename"
  add_index "mt_author", ["author_created_on"], :name => "mt_author_created_on"
  add_index "mt_author", ["author_email"], :name => "mt_author_email"
  add_index "mt_author", ["author_external_id"], :name => "mt_author_external_id"
  add_index "mt_author", ["author_name"], :name => "mt_author_name"
  add_index "mt_author", ["author_status"], :name => "mt_author_status"
  add_index "mt_author", ["author_type"], :name => "mt_author_type"

  create_table "mt_author_meta", :id => false, :force => true do |t|
    t.integer  "author_meta_author_id",                         :null => false
    t.string   "author_meta_type",          :limit => 75,       :null => false
    t.string   "author_meta_vchar"
    t.string   "author_meta_vchar_idx"
    t.datetime "author_meta_vdatetime"
    t.datetime "author_meta_vdatetime_idx"
    t.integer  "author_meta_vinteger"
    t.integer  "author_meta_vinteger_idx"
    t.float    "author_meta_vfloat"
    t.float    "author_meta_vfloat_idx"
    t.binary   "author_meta_vblob",         :limit => 16777215
    t.text     "author_meta_vclob",         :limit => 16777215
  end

  add_index "mt_author_meta", ["author_meta_type", "author_meta_vchar_idx"], :name => "mt_author_meta_type_vchar"
  add_index "mt_author_meta", ["author_meta_type", "author_meta_vdatetime_idx"], :name => "mt_author_meta_type_vdt"
  add_index "mt_author_meta", ["author_meta_type", "author_meta_vfloat_idx"], :name => "mt_author_meta_type_vflt"
  add_index "mt_author_meta", ["author_meta_type", "author_meta_vinteger_idx"], :name => "mt_author_meta_type_vint"

  create_table "mt_blog", :primary_key => "blog_id", :force => true do |t|
    t.integer  "blog_allow_anon_comments",       :limit => 1
    t.integer  "blog_allow_comment_html",        :limit => 1
    t.integer  "blog_allow_commenter_regist",    :limit => 1
    t.integer  "blog_allow_comments_default",    :limit => 1
    t.integer  "blog_allow_pings",               :limit => 1
    t.integer  "blog_allow_pings_default",       :limit => 1
    t.integer  "blog_allow_reg_comments",        :limit => 1
    t.integer  "blog_allow_unreg_comments",      :limit => 1
    t.string   "blog_archive_path"
    t.string   "blog_archive_tmpl_category"
    t.string   "blog_archive_tmpl_daily"
    t.string   "blog_archive_tmpl_individual"
    t.string   "blog_archive_tmpl_monthly"
    t.string   "blog_archive_tmpl_weekly"
    t.string   "blog_archive_type"
    t.string   "blog_archive_type_preferred",    :limit => 25
    t.string   "blog_archive_url"
    t.integer  "blog_autodiscover_links",        :limit => 1
    t.integer  "blog_autolink_urls",             :limit => 1
    t.integer  "blog_basename_limit",            :limit => 2
    t.string   "blog_cc_license"
    t.datetime "blog_children_modified_on"
    t.string   "blog_convert_paras",             :limit => 30
    t.string   "blog_convert_paras_comments",    :limit => 30
    t.integer  "blog_created_by"
    t.datetime "blog_created_on"
    t.string   "blog_custom_dynamic_templates",  :limit => 25,       :default => "none"
    t.integer  "blog_days_on_index"
    t.text     "blog_description",               :limit => 16777215
    t.integer  "blog_email_new_comments",        :limit => 1
    t.integer  "blog_email_new_pings",           :limit => 1
    t.integer  "blog_entries_on_index"
    t.string   "blog_file_extension",            :limit => 10
    t.string   "blog_google_api_key",            :limit => 32
    t.integer  "blog_internal_autodiscovery",    :limit => 1
    t.integer  "blog_is_dynamic",                :limit => 1
    t.integer  "blog_junk_folder_expiry"
    t.float    "blog_junk_score_threshold"
    t.string   "blog_language",                  :limit => 5
    t.integer  "blog_manual_approve_commenters", :limit => 1
    t.integer  "blog_moderate_pings",            :limit => 1
    t.integer  "blog_moderate_unreg_comments",   :limit => 1
    t.integer  "blog_modified_by"
    t.datetime "blog_modified_on"
    t.string   "blog_mt_update_key",             :limit => 30
    t.string   "blog_name",                                                              :null => false
    t.integer  "blog_old_style_archive_links",   :limit => 1
    t.integer  "blog_ping_blogs",                :limit => 1
    t.integer  "blog_ping_google",               :limit => 1
    t.text     "blog_ping_others",               :limit => 16777215
    t.integer  "blog_ping_technorati",           :limit => 1
    t.integer  "blog_ping_weblogs",              :limit => 1
    t.string   "blog_remote_auth_token",         :limit => 50
    t.integer  "blog_require_comment_emails",    :limit => 1
    t.string   "blog_sanitize_spec"
    t.float    "blog_server_offset"
    t.string   "blog_site_path"
    t.string   "blog_site_url"
    t.string   "blog_sort_order_comments",       :limit => 8
    t.string   "blog_sort_order_posts",          :limit => 8
    t.integer  "blog_status_default",            :limit => 2
    t.integer  "blog_use_comment_confirmation",  :limit => 1
    t.text     "blog_welcome_msg",               :limit => 16777215
    t.integer  "blog_words_in_excerpt",          :limit => 2
  end

  add_index "mt_blog", ["blog_name"], :name => "mt_blog_name"

  create_table "mt_blog_meta", :id => false, :force => true do |t|
    t.integer  "blog_meta_blog_id",                           :null => false
    t.string   "blog_meta_type",          :limit => 75,       :null => false
    t.string   "blog_meta_vchar"
    t.string   "blog_meta_vchar_idx"
    t.datetime "blog_meta_vdatetime"
    t.datetime "blog_meta_vdatetime_idx"
    t.integer  "blog_meta_vinteger"
    t.integer  "blog_meta_vinteger_idx"
    t.float    "blog_meta_vfloat"
    t.float    "blog_meta_vfloat_idx"
    t.binary   "blog_meta_vblob",         :limit => 16777215
    t.text     "blog_meta_vclob",         :limit => 16777215
  end

  add_index "mt_blog_meta", ["blog_meta_type", "blog_meta_vchar_idx"], :name => "mt_blog_meta_type_vchar"
  add_index "mt_blog_meta", ["blog_meta_type", "blog_meta_vdatetime_idx"], :name => "mt_blog_meta_type_vdt"
  add_index "mt_blog_meta", ["blog_meta_type", "blog_meta_vfloat_idx"], :name => "mt_blog_meta_type_vflt"
  add_index "mt_blog_meta", ["blog_meta_type", "blog_meta_vinteger_idx"], :name => "mt_blog_meta_type_vint"

  create_table "mt_category", :primary_key => "category_id", :force => true do |t|
    t.integer  "category_allow_pings", :limit => 1,        :default => 0
    t.integer  "category_author_id"
    t.string   "category_basename"
    t.integer  "category_blog_id",                                                 :null => false
    t.string   "category_class",                           :default => "category"
    t.integer  "category_created_by"
    t.datetime "category_created_on"
    t.text     "category_description", :limit => 16777215
    t.string   "category_label",       :limit => 100,                              :null => false
    t.integer  "category_modified_by"
    t.datetime "category_modified_on"
    t.integer  "category_parent",                          :default => 0
    t.text     "category_ping_urls",   :limit => 16777215
  end

  add_index "mt_category", ["category_blog_id", "category_basename"], :name => "mt_category_blog_basename"
  add_index "mt_category", ["category_blog_id", "category_class"], :name => "mt_category_blog_class"
  add_index "mt_category", ["category_blog_id"], :name => "mt_category_blog_id"
  add_index "mt_category", ["category_class"], :name => "mt_category_class"
  add_index "mt_category", ["category_label"], :name => "mt_category_label"
  add_index "mt_category", ["category_parent"], :name => "mt_category_parent"

  create_table "mt_category_meta", :id => false, :force => true do |t|
    t.integer  "category_meta_category_id",                       :null => false
    t.string   "category_meta_type",          :limit => 75,       :null => false
    t.string   "category_meta_vchar"
    t.string   "category_meta_vchar_idx"
    t.datetime "category_meta_vdatetime"
    t.datetime "category_meta_vdatetime_idx"
    t.integer  "category_meta_vinteger"
    t.integer  "category_meta_vinteger_idx"
    t.float    "category_meta_vfloat"
    t.float    "category_meta_vfloat_idx"
    t.binary   "category_meta_vblob",         :limit => 16777215
    t.text     "category_meta_vclob",         :limit => 16777215
  end

  add_index "mt_category_meta", ["category_meta_type", "category_meta_vchar_idx"], :name => "mt_category_meta_type_vchar"
  add_index "mt_category_meta", ["category_meta_type", "category_meta_vdatetime_idx"], :name => "mt_category_meta_type_vdt"
  add_index "mt_category_meta", ["category_meta_type", "category_meta_vfloat_idx"], :name => "mt_category_meta_type_vflt"
  add_index "mt_category_meta", ["category_meta_type", "category_meta_vinteger_idx"], :name => "mt_category_meta_type_vint"

  create_table "mt_chipcount", :primary_key => "chipcount_id", :force => true do |t|
    t.integer  "chipcount_blog_id"
    t.integer  "chipcount_chipcount"
    t.string   "chipcount_class",       :default => "chipcount"
    t.integer  "chipcount_created_by"
    t.datetime "chipcount_created_on"
    t.integer  "chipcount_modified_by"
    t.datetime "chipcount_modified_on"
    t.integer  "chipcount_player_id"
  end

  add_index "mt_chipcount", ["chipcount_class"], :name => "mt_chipcount_class"

  create_table "mt_chipcountplayer", :primary_key => "chipcountplayer_id", :force => true do |t|
    t.integer  "chipcountplayer_blog_id"
    t.string   "chipcountplayer_class",                      :default => "player"
    t.string   "chipcountplayer_country",     :limit => 200,                       :null => false
    t.integer  "chipcountplayer_created_by"
    t.datetime "chipcountplayer_created_on"
    t.string   "chipcountplayer_event",       :limit => 200,                       :null => false
    t.integer  "chipcountplayer_ignored",     :limit => 1
    t.integer  "chipcountplayer_modified_by"
    t.datetime "chipcountplayer_modified_on"
    t.string   "chipcountplayer_name",        :limit => 200,                       :null => false
  end

  add_index "mt_chipcountplayer", ["chipcountplayer_class"], :name => "mt_chipcountplayer_class"
  add_index "mt_chipcountplayer", ["chipcountplayer_name"], :name => "mt_chipcountplayer_name"

  create_table "mt_comment", :primary_key => "comment_id", :force => true do |t|
    t.string   "comment_author",        :limit => 100
    t.integer  "comment_blog_id",                                                              :null => false
    t.integer  "comment_commenter_id"
    t.integer  "comment_created_by"
    t.datetime "comment_created_on"
    t.string   "comment_email",         :limit => 75
    t.integer  "comment_entry_id",                                                             :null => false
    t.string   "comment_ip",            :limit => 50
    t.text     "comment_junk_log",      :limit => 16777215
    t.float    "comment_junk_score"
    t.integer  "comment_junk_status",   :limit => 2,        :default => 1
    t.datetime "comment_last_moved_on",                     :default => '2000-01-01 00:00:00', :null => false
    t.integer  "comment_modified_by"
    t.datetime "comment_modified_on"
    t.integer  "comment_parent_id"
    t.text     "comment_text",          :limit => 16777215
    t.string   "comment_url"
    t.integer  "comment_visible",       :limit => 1
  end

  add_index "mt_comment", ["comment_blog_id", "comment_ip", "comment_created_on"], :name => "mt_comment_blog_ip_date"
  add_index "mt_comment", ["comment_blog_id", "comment_junk_status", "comment_created_on"], :name => "mt_comment_blog_stat"
  add_index "mt_comment", ["comment_blog_id", "comment_visible", "comment_created_on", "comment_id"], :name => "mt_comment_blog_visible"
  add_index "mt_comment", ["comment_blog_id", "comment_visible", "comment_url"], :name => "mt_comment_blog_url"
  add_index "mt_comment", ["comment_commenter_id"], :name => "mt_comment_commenter_id"
  add_index "mt_comment", ["comment_created_on"], :name => "mt_comment_created_on"
  add_index "mt_comment", ["comment_email"], :name => "mt_comment_email"
  add_index "mt_comment", ["comment_entry_id", "comment_visible", "comment_created_on"], :name => "mt_comment_entry_visible"
  add_index "mt_comment", ["comment_junk_status", "comment_created_on"], :name => "mt_comment_junk_date"
  add_index "mt_comment", ["comment_last_moved_on"], :name => "mt_comment_last_moved_on"
  add_index "mt_comment", ["comment_parent_id"], :name => "mt_comment_parent_id"
  add_index "mt_comment", ["comment_visible", "comment_created_on"], :name => "mt_comment_visible_date"

  create_table "mt_comment_meta", :id => false, :force => true do |t|
    t.integer  "comment_meta_comment_id",                        :null => false
    t.string   "comment_meta_type",          :limit => 75,       :null => false
    t.string   "comment_meta_vchar"
    t.string   "comment_meta_vchar_idx"
    t.datetime "comment_meta_vdatetime"
    t.datetime "comment_meta_vdatetime_idx"
    t.integer  "comment_meta_vinteger"
    t.integer  "comment_meta_vinteger_idx"
    t.float    "comment_meta_vfloat"
    t.float    "comment_meta_vfloat_idx"
    t.binary   "comment_meta_vblob",         :limit => 16777215
    t.text     "comment_meta_vclob",         :limit => 16777215
  end

  add_index "mt_comment_meta", ["comment_meta_type", "comment_meta_vchar_idx"], :name => "mt_comment_meta_type_vchar"
  add_index "mt_comment_meta", ["comment_meta_type", "comment_meta_vdatetime_idx"], :name => "mt_comment_meta_type_vdt"
  add_index "mt_comment_meta", ["comment_meta_type", "comment_meta_vfloat_idx"], :name => "mt_comment_meta_type_vflt"
  add_index "mt_comment_meta", ["comment_meta_type", "comment_meta_vinteger_idx"], :name => "mt_comment_meta_type_vint"

  create_table "mt_config", :primary_key => "config_id", :force => true do |t|
    t.text "config_data", :limit => 16777215
  end

  create_table "mt_entry", :primary_key => "entry_id", :force => true do |t|
    t.integer  "entry_allow_comments", :limit => 1
    t.integer  "entry_allow_pings",    :limit => 1
    t.string   "entry_atom_id"
    t.integer  "entry_author_id",                                               :null => false
    t.datetime "entry_authored_on"
    t.string   "entry_basename"
    t.integer  "entry_blog_id",                                                 :null => false
    t.integer  "entry_category_id"
    t.string   "entry_class",                              :default => "entry"
    t.integer  "entry_comment_count",                      :default => 0
    t.string   "entry_convert_breaks", :limit => 30
    t.integer  "entry_created_by"
    t.datetime "entry_created_on"
    t.text     "entry_excerpt",        :limit => 16777215
    t.text     "entry_keywords",       :limit => 16777215
    t.integer  "entry_modified_by"
    t.datetime "entry_modified_on"
    t.integer  "entry_ping_count",                         :default => 0
    t.text     "entry_pinged_urls",    :limit => 16777215
    t.integer  "entry_status",         :limit => 2,                             :null => false
    t.text     "entry_tangent_cache",  :limit => 16777215
    t.integer  "entry_template_id"
    t.text     "entry_text",           :limit => 16777215
    t.text     "entry_text_more",      :limit => 16777215
    t.string   "entry_title"
    t.text     "entry_to_ping_urls",   :limit => 16777215
    t.integer  "entry_week_number"
  end

  add_index "mt_entry", ["entry_author_id"], :name => "mt_entry_author_id"
  add_index "mt_entry", ["entry_authored_on"], :name => "mt_entry_authored_on"
  add_index "mt_entry", ["entry_blog_id", "entry_basename"], :name => "mt_entry_blog_basename"
  add_index "mt_entry", ["entry_blog_id", "entry_class", "entry_author_id", "entry_authored_on"], :name => "mt_entry_blog_author"
  add_index "mt_entry", ["entry_blog_id", "entry_class", "entry_authored_on"], :name => "mt_entry_blog_authored"
  add_index "mt_entry", ["entry_blog_id", "entry_class", "entry_status", "entry_authored_on", "entry_id"], :name => "mt_entry_blog_stat_date"
  add_index "mt_entry", ["entry_blog_id", "entry_class", "entry_status", "entry_week_number"], :name => "mt_entry_blog_week"
  add_index "mt_entry", ["entry_class", "entry_authored_on"], :name => "mt_entry_class_authored"
  add_index "mt_entry", ["entry_class"], :name => "mt_entry_class"
  add_index "mt_entry", ["entry_created_on"], :name => "mt_entry_created_on"
  add_index "mt_entry", ["entry_modified_on"], :name => "mt_entry_modified_on"
  add_index "mt_entry", ["entry_status", "entry_class", "entry_blog_id", "entry_id"], :name => "mt_entry_tag_count"
  add_index "mt_entry", ["entry_status"], :name => "mt_entry_status"
  add_index "mt_entry", ["entry_title"], :name => "mt_entry_title"

  create_table "mt_entry_meta", :id => false, :force => true do |t|
    t.integer  "entry_meta_entry_id",                          :null => false
    t.string   "entry_meta_type",          :limit => 75,       :null => false
    t.string   "entry_meta_vchar"
    t.string   "entry_meta_vchar_idx"
    t.datetime "entry_meta_vdatetime"
    t.datetime "entry_meta_vdatetime_idx"
    t.integer  "entry_meta_vinteger"
    t.integer  "entry_meta_vinteger_idx"
    t.float    "entry_meta_vfloat"
    t.float    "entry_meta_vfloat_idx"
    t.binary   "entry_meta_vblob",         :limit => 16777215
    t.text     "entry_meta_vclob",         :limit => 16777215
  end

  add_index "mt_entry_meta", ["entry_meta_type", "entry_meta_vchar_idx"], :name => "mt_entry_meta_type_vchar"
  add_index "mt_entry_meta", ["entry_meta_type", "entry_meta_vdatetime_idx"], :name => "mt_entry_meta_type_vdt"
  add_index "mt_entry_meta", ["entry_meta_type", "entry_meta_vfloat_idx"], :name => "mt_entry_meta_type_vflt"
  add_index "mt_entry_meta", ["entry_meta_type", "entry_meta_vinteger_idx"], :name => "mt_entry_meta_type_vint"

  create_table "mt_field", :primary_key => "field_id", :force => true do |t|
    t.string  "field_basename"
    t.integer "field_blog_id"
    t.text    "field_default",     :limit => 16777215
    t.text    "field_description", :limit => 16777215
    t.string  "field_name",                            :null => false
    t.string  "field_obj_type",    :limit => 50,       :null => false
    t.text    "field_options",     :limit => 16777215
    t.integer "field_required",    :limit => 1
    t.string  "field_tag",                             :null => false
    t.string  "field_type",        :limit => 50,       :null => false
  end

  add_index "mt_field", ["field_basename"], :name => "mt_field_basename"
  add_index "mt_field", ["field_blog_id", "field_tag"], :name => "mt_field_blog_tag"
  add_index "mt_field", ["field_blog_id"], :name => "mt_field_blog_id"
  add_index "mt_field", ["field_name"], :name => "mt_field_name"
  add_index "mt_field", ["field_obj_type"], :name => "mt_field_obj_type"
  add_index "mt_field", ["field_type"], :name => "mt_field_type"

  create_table "mt_fileinfo", :primary_key => "fileinfo_id", :force => true do |t|
    t.string  "fileinfo_archive_type"
    t.integer "fileinfo_author_id"
    t.integer "fileinfo_blog_id",                            :null => false
    t.integer "fileinfo_category_id"
    t.integer "fileinfo_entry_id"
    t.text    "fileinfo_file_path",      :limit => 16777215
    t.string  "fileinfo_startdate",      :limit => 80
    t.integer "fileinfo_template_id"
    t.integer "fileinfo_templatemap_id"
    t.string  "fileinfo_url"
    t.integer "fileinfo_virtual",        :limit => 1
  end

  add_index "mt_fileinfo", ["fileinfo_archive_type"], :name => "mt_fileinfo_archive_type"
  add_index "mt_fileinfo", ["fileinfo_author_id"], :name => "mt_fileinfo_author_id"
  add_index "mt_fileinfo", ["fileinfo_blog_id"], :name => "mt_fileinfo_blog_id"
  add_index "mt_fileinfo", ["fileinfo_category_id"], :name => "mt_fileinfo_category_id"
  add_index "mt_fileinfo", ["fileinfo_entry_id"], :name => "mt_fileinfo_entry_id"
  add_index "mt_fileinfo", ["fileinfo_startdate"], :name => "mt_fileinfo_startdate"
  add_index "mt_fileinfo", ["fileinfo_template_id"], :name => "mt_fileinfo_template_id"
  add_index "mt_fileinfo", ["fileinfo_templatemap_id"], :name => "mt_fileinfo_templatemap_id"
  add_index "mt_fileinfo", ["fileinfo_url"], :name => "mt_fileinfo_url"

  create_table "mt_ipbanlist", :primary_key => "ipbanlist_id", :force => true do |t|
    t.integer  "ipbanlist_blog_id",                   :null => false
    t.integer  "ipbanlist_created_by"
    t.datetime "ipbanlist_created_on"
    t.string   "ipbanlist_ip",          :limit => 50, :null => false
    t.integer  "ipbanlist_modified_by"
    t.datetime "ipbanlist_modified_on"
  end

  add_index "mt_ipbanlist", ["ipbanlist_blog_id"], :name => "mt_ipbanlist_blog_id"
  add_index "mt_ipbanlist", ["ipbanlist_ip"], :name => "mt_ipbanlist_ip"

  create_table "mt_log", :primary_key => "log_id", :force => true do |t|
    t.integer  "log_author_id",                       :default => 0
    t.integer  "log_blog_id",                         :default => 0
    t.string   "log_category"
    t.string   "log_class",                           :default => "system"
    t.integer  "log_created_by"
    t.datetime "log_created_on"
    t.string   "log_ip",          :limit => 50
    t.integer  "log_level",                           :default => 1
    t.text     "log_message",     :limit => 16777215
    t.string   "log_metadata"
    t.integer  "log_modified_by"
    t.datetime "log_modified_on"
  end

  add_index "mt_log", ["log_blog_id"], :name => "mt_log_blog_id"
  add_index "mt_log", ["log_class"], :name => "mt_log_class"
  add_index "mt_log", ["log_created_on"], :name => "mt_log_created_on"
  add_index "mt_log", ["log_level"], :name => "mt_log_level"

  create_table "mt_notification", :primary_key => "notification_id", :force => true do |t|
    t.integer  "notification_blog_id",                   :null => false
    t.integer  "notification_created_by"
    t.datetime "notification_created_on"
    t.string   "notification_email",       :limit => 75
    t.integer  "notification_modified_by"
    t.datetime "notification_modified_on"
    t.string   "notification_name",        :limit => 50
    t.string   "notification_url"
  end

  add_index "mt_notification", ["notification_blog_id"], :name => "mt_notification_blog_id"
  add_index "mt_notification", ["notification_email"], :name => "mt_notification_email"

  create_table "mt_objectasset", :primary_key => "objectasset_id", :force => true do |t|
    t.integer "objectasset_asset_id",                               :null => false
    t.integer "objectasset_blog_id"
    t.integer "objectasset_embedded",  :limit => 1,  :default => 0
    t.string  "objectasset_object_ds", :limit => 50,                :null => false
    t.integer "objectasset_object_id",                              :null => false
  end

  add_index "mt_objectasset", ["objectasset_asset_id"], :name => "mt_objectasset_asset_id"
  add_index "mt_objectasset", ["objectasset_blog_id", "objectasset_object_ds", "objectasset_object_id"], :name => "mt_objectasset_blog_obj"

  create_table "mt_objectscore", :primary_key => "objectscore_id", :force => true do |t|
    t.integer  "objectscore_author_id",                 :default => 0
    t.integer  "objectscore_created_by"
    t.datetime "objectscore_created_on"
    t.string   "objectscore_ip",          :limit => 50
    t.integer  "objectscore_modified_by"
    t.datetime "objectscore_modified_on"
    t.string   "objectscore_namespace",                                :null => false
    t.string   "objectscore_object_ds",   :limit => 50,                :null => false
    t.integer  "objectscore_object_id",                 :default => 0
    t.float    "objectscore_score"
  end

  add_index "mt_objectscore", ["objectscore_author_id", "objectscore_namespace"], :name => "mt_objectscore_user_ns"
  add_index "mt_objectscore", ["objectscore_namespace", "objectscore_author_id", "objectscore_object_ds", "objectscore_object_id"], :name => "mt_objectscore_ns_user_ds_obj"
  add_index "mt_objectscore", ["objectscore_namespace", "objectscore_ip", "objectscore_object_ds", "objectscore_object_id"], :name => "mt_objectscore_ns_ip_ds_obj"
  add_index "mt_objectscore", ["objectscore_object_ds", "objectscore_object_id"], :name => "mt_objectscore_ds_obj"

  create_table "mt_objecttag", :primary_key => "objecttag_id", :force => true do |t|
    t.integer "objecttag_blog_id"
    t.string  "objecttag_object_datasource", :limit => 50, :null => false
    t.integer "objecttag_object_id",                       :null => false
    t.integer "objecttag_tag_id",                          :null => false
  end

  add_index "mt_objecttag", ["objecttag_blog_id", "objecttag_object_datasource", "objecttag_object_id", "objecttag_tag_id"], :name => "mt_objecttag_blog_ds_obj_tag"
  add_index "mt_objecttag", ["objecttag_blog_id", "objecttag_object_datasource", "objecttag_tag_id"], :name => "mt_objecttag_blog_ds_tag"
  add_index "mt_objecttag", ["objecttag_object_datasource"], :name => "mt_objecttag_object_datasource"
  add_index "mt_objecttag", ["objecttag_object_id"], :name => "mt_objecttag_object_id"
  add_index "mt_objecttag", ["objecttag_tag_id"], :name => "mt_objecttag_tag_id"

  create_table "mt_permission", :primary_key => "permission_id", :force => true do |t|
    t.integer  "permission_author_id",                          :default => 0, :null => false
    t.integer  "permission_blog_id",                            :default => 0, :null => false
    t.string   "permission_blog_prefs"
    t.integer  "permission_created_by"
    t.datetime "permission_created_on"
    t.text     "permission_entry_prefs",    :limit => 16777215
    t.integer  "permission_modified_by"
    t.datetime "permission_modified_on"
    t.text     "permission_permissions",    :limit => 16777215
    t.text     "permission_restrictions",   :limit => 16777215
    t.integer  "permission_role_mask",                          :default => 0
    t.string   "permission_template_prefs"
  end

  add_index "mt_permission", ["permission_author_id"], :name => "mt_permission_author_id"
  add_index "mt_permission", ["permission_blog_id"], :name => "mt_permission_blog_id"
  add_index "mt_permission", ["permission_role_mask"], :name => "mt_permission_role_mask"

  create_table "mt_placement", :primary_key => "placement_id", :force => true do |t|
    t.integer "placement_blog_id",                  :null => false
    t.integer "placement_category_id",              :null => false
    t.integer "placement_entry_id",                 :null => false
    t.integer "placement_is_primary",  :limit => 1, :null => false
  end

  add_index "mt_placement", ["placement_blog_id", "placement_category_id"], :name => "mt_placement_blog_cat"
  add_index "mt_placement", ["placement_blog_id"], :name => "mt_placement_blog_id"
  add_index "mt_placement", ["placement_category_id"], :name => "mt_placement_category_id"
  add_index "mt_placement", ["placement_entry_id"], :name => "mt_placement_entry_id"
  add_index "mt_placement", ["placement_is_primary"], :name => "mt_placement_is_primary"

  create_table "mt_plugindata", :primary_key => "plugindata_id", :force => true do |t|
    t.binary "plugindata_data",   :limit => 16777215
    t.string "plugindata_key",                        :null => false
    t.string "plugindata_plugin", :limit => 50,       :null => false
  end

  add_index "mt_plugindata", ["plugindata_key"], :name => "mt_plugindata_key"
  add_index "mt_plugindata", ["plugindata_plugin"], :name => "mt_plugindata_plugin"

  create_table "mt_profileevent", :primary_key => "profileevent_id", :force => true do |t|
    t.integer  "profileevent_author_id",                                       :null => false
    t.string   "profileevent_class",                      :default => "event"
    t.integer  "profileevent_created_by"
    t.datetime "profileevent_created_on"
    t.string   "profileevent_identifier",  :limit => 200
    t.integer  "profileevent_modified_by"
    t.datetime "profileevent_modified_on"
    t.integer  "profileevent_visible",                    :default => 1,       :null => false
  end

  add_index "mt_profileevent", ["profileevent_author_id"], :name => "mt_profileevent_author_id"
  add_index "mt_profileevent", ["profileevent_class"], :name => "mt_profileevent_class"
  add_index "mt_profileevent", ["profileevent_created_by"], :name => "mt_profileevent_created_by"
  add_index "mt_profileevent", ["profileevent_created_on"], :name => "mt_profileevent_created_on"
  add_index "mt_profileevent", ["profileevent_identifier"], :name => "mt_profileevent_identifier"

  create_table "mt_profileevent_meta", :id => false, :force => true do |t|
    t.integer  "profileevent_meta_profileevent_id",                     :null => false
    t.string   "profileevent_meta_type",            :limit => 75,       :null => false
    t.string   "profileevent_meta_vchar"
    t.string   "profileevent_meta_vchar_idx"
    t.datetime "profileevent_meta_vdatetime"
    t.datetime "profileevent_meta_vdatetime_idx"
    t.integer  "profileevent_meta_vinteger"
    t.integer  "profileevent_meta_vinteger_idx"
    t.float    "profileevent_meta_vfloat"
    t.float    "profileevent_meta_vfloat_idx"
    t.binary   "profileevent_meta_vblob",           :limit => 16777215
    t.text     "profileevent_meta_vclob",           :limit => 16777215
  end

  add_index "mt_profileevent_meta", ["profileevent_meta_type", "profileevent_meta_vchar_idx"], :name => "mt_profileevent_meta_type_vchar"
  add_index "mt_profileevent_meta", ["profileevent_meta_type", "profileevent_meta_vdatetime_idx"], :name => "mt_profileevent_meta_type_vdt"
  add_index "mt_profileevent_meta", ["profileevent_meta_type", "profileevent_meta_vfloat_idx"], :name => "mt_profileevent_meta_type_vflt"
  add_index "mt_profileevent_meta", ["profileevent_meta_type", "profileevent_meta_vinteger_idx"], :name => "mt_profileevent_meta_type_vint"

  create_table "mt_role", :primary_key => "role_id", :force => true do |t|
    t.integer  "role_created_by"
    t.datetime "role_created_on"
    t.text     "role_description", :limit => 16777215
    t.integer  "role_is_system",   :limit => 1,        :default => 0
    t.integer  "role_modified_by"
    t.datetime "role_modified_on"
    t.string   "role_name",                                           :null => false
    t.text     "role_permissions", :limit => 16777215
    t.integer  "role_role_mask"
    t.integer  "role_role_mask2"
    t.integer  "role_role_mask3"
    t.integer  "role_role_mask4"
  end

  add_index "mt_role", ["role_created_on"], :name => "mt_role_created_on"
  add_index "mt_role", ["role_is_system"], :name => "mt_role_is_system"
  add_index "mt_role", ["role_name"], :name => "mt_role_name"

  create_table "mt_session", :primary_key => "session_id", :force => true do |t|
    t.binary  "session_data",  :limit => 16777215
    t.string  "session_email"
    t.string  "session_kind",  :limit => 2
    t.string  "session_name"
    t.integer "session_start",                     :null => false
  end

  add_index "mt_session", ["session_kind"], :name => "mt_session_kind"
  add_index "mt_session", ["session_name"], :name => "mt_session_name"
  add_index "mt_session", ["session_start"], :name => "mt_session_start"

  create_table "mt_tag", :primary_key => "tag_id", :force => true do |t|
    t.integer "tag_is_private", :limit => 1, :default => 0
    t.integer "tag_n8d_id",                  :default => 0
    t.string  "tag_name",                                   :null => false
  end

  add_index "mt_tag", ["tag_is_private", "tag_id", "tag_name"], :name => "mt_tag_private_id_name"
  add_index "mt_tag", ["tag_n8d_id"], :name => "mt_tag_n8d_id"
  add_index "mt_tag", ["tag_name", "tag_id"], :name => "mt_tag_name_id"
  add_index "mt_tag", ["tag_name"], :name => "mt_tag_name"

  create_table "mt_tbping", :primary_key => "tbping_id", :force => true do |t|
    t.integer  "tbping_blog_id",                                                              :null => false
    t.string   "tbping_blog_name"
    t.integer  "tbping_created_by"
    t.datetime "tbping_created_on"
    t.text     "tbping_excerpt",       :limit => 16777215
    t.string   "tbping_ip",            :limit => 50,                                          :null => false
    t.text     "tbping_junk_log",      :limit => 16777215
    t.float    "tbping_junk_score"
    t.integer  "tbping_junk_status",   :limit => 2,        :default => 1,                     :null => false
    t.datetime "tbping_last_moved_on",                     :default => '2000-01-01 00:00:00', :null => false
    t.integer  "tbping_modified_by"
    t.datetime "tbping_modified_on"
    t.string   "tbping_source_url"
    t.integer  "tbping_tb_id",                                                                :null => false
    t.string   "tbping_title"
    t.integer  "tbping_visible",       :limit => 1
  end

  add_index "mt_tbping", ["tbping_blog_id", "tbping_junk_status", "tbping_created_on"], :name => "mt_tbping_blog_stat"
  add_index "mt_tbping", ["tbping_blog_id", "tbping_visible", "tbping_created_on", "tbping_id"], :name => "mt_tbping_blog_visible"
  add_index "mt_tbping", ["tbping_blog_id", "tbping_visible", "tbping_source_url"], :name => "mt_tbping_blog_url"
  add_index "mt_tbping", ["tbping_created_on"], :name => "mt_tbping_created_on"
  add_index "mt_tbping", ["tbping_ip"], :name => "mt_tbping_ip"
  add_index "mt_tbping", ["tbping_junk_status", "tbping_created_on"], :name => "mt_tbping_junk_date"
  add_index "mt_tbping", ["tbping_last_moved_on"], :name => "mt_tbping_last_moved_on"
  add_index "mt_tbping", ["tbping_tb_id", "tbping_visible", "tbping_created_on"], :name => "mt_tbping_tb_visible"
  add_index "mt_tbping", ["tbping_visible", "tbping_created_on"], :name => "mt_tbping_visible_date"

  create_table "mt_tbping_meta", :id => false, :force => true do |t|
    t.integer  "tbping_meta_tbping_id",                         :null => false
    t.string   "tbping_meta_type",          :limit => 75,       :null => false
    t.string   "tbping_meta_vchar"
    t.string   "tbping_meta_vchar_idx"
    t.datetime "tbping_meta_vdatetime"
    t.datetime "tbping_meta_vdatetime_idx"
    t.integer  "tbping_meta_vinteger"
    t.integer  "tbping_meta_vinteger_idx"
    t.float    "tbping_meta_vfloat"
    t.float    "tbping_meta_vfloat_idx"
    t.binary   "tbping_meta_vblob",         :limit => 16777215
    t.text     "tbping_meta_vclob",         :limit => 16777215
  end

  add_index "mt_tbping_meta", ["tbping_meta_type", "tbping_meta_vchar_idx"], :name => "mt_tbping_meta_type_vchar"
  add_index "mt_tbping_meta", ["tbping_meta_type", "tbping_meta_vdatetime_idx"], :name => "mt_tbping_meta_type_vdt"
  add_index "mt_tbping_meta", ["tbping_meta_type", "tbping_meta_vfloat_idx"], :name => "mt_tbping_meta_type_vflt"
  add_index "mt_tbping_meta", ["tbping_meta_type", "tbping_meta_vinteger_idx"], :name => "mt_tbping_meta_type_vint"

  create_table "mt_template", :primary_key => "template_id", :force => true do |t|
    t.integer  "template_blog_id",                                              :null => false
    t.integer  "template_build_dynamic",     :limit => 1,        :default => 0
    t.integer  "template_build_interval",                        :default => 0
    t.integer  "template_build_type",        :limit => 2,        :default => 1
    t.integer  "template_created_by"
    t.datetime "template_created_on"
    t.string   "template_identifier",        :limit => 50
    t.string   "template_linked_file"
    t.string   "template_linked_file_mtime", :limit => 10
    t.integer  "template_linked_file_size"
    t.integer  "template_modified_by"
    t.datetime "template_modified_on"
    t.string   "template_name",                                                 :null => false
    t.string   "template_outfile"
    t.integer  "template_rebuild_me",        :limit => 1,        :default => 1
    t.text     "template_text",              :limit => 16777215
    t.string   "template_type",              :limit => 25,                      :null => false
  end

  add_index "mt_template", ["template_blog_id"], :name => "mt_template_blog_id"
  add_index "mt_template", ["template_identifier"], :name => "mt_template_identifier"
  add_index "mt_template", ["template_name"], :name => "mt_template_name"
  add_index "mt_template", ["template_outfile"], :name => "mt_template_outfile"
  add_index "mt_template", ["template_type"], :name => "mt_template_type"

  create_table "mt_template_meta", :id => false, :force => true do |t|
    t.integer  "template_meta_template_id",                       :null => false
    t.string   "template_meta_type",          :limit => 75,       :null => false
    t.string   "template_meta_vchar"
    t.string   "template_meta_vchar_idx"
    t.datetime "template_meta_vdatetime"
    t.datetime "template_meta_vdatetime_idx"
    t.integer  "template_meta_vinteger"
    t.integer  "template_meta_vinteger_idx"
    t.float    "template_meta_vfloat"
    t.float    "template_meta_vfloat_idx"
    t.binary   "template_meta_vblob",         :limit => 16777215
    t.text     "template_meta_vclob",         :limit => 16777215
  end

  add_index "mt_template_meta", ["template_meta_type", "template_meta_vchar_idx"], :name => "mt_template_meta_type_vchar"
  add_index "mt_template_meta", ["template_meta_type", "template_meta_vdatetime_idx"], :name => "mt_template_meta_type_vdt"
  add_index "mt_template_meta", ["template_meta_type", "template_meta_vfloat_idx"], :name => "mt_template_meta_type_vflt"
  add_index "mt_template_meta", ["template_meta_type", "template_meta_vinteger_idx"], :name => "mt_template_meta_type_vint"

  create_table "mt_templatemap", :primary_key => "templatemap_id", :force => true do |t|
    t.string  "templatemap_archive_type",   :limit => 25,                :null => false
    t.integer "templatemap_blog_id",                                     :null => false
    t.integer "templatemap_build_interval"
    t.integer "templatemap_build_type",     :limit => 2,  :default => 1
    t.string  "templatemap_file_template"
    t.integer "templatemap_is_preferred",   :limit => 1
    t.integer "templatemap_template_id",                                 :null => false
  end

  add_index "mt_templatemap", ["templatemap_archive_type"], :name => "mt_templatemap_archive_type"
  add_index "mt_templatemap", ["templatemap_blog_id"], :name => "mt_templatemap_blog_id"
  add_index "mt_templatemap", ["templatemap_is_preferred"], :name => "mt_templatemap_is_preferred"
  add_index "mt_templatemap", ["templatemap_template_id"], :name => "mt_templatemap_template_id"

  create_table "mt_touch", :primary_key => "touch_id", :force => true do |t|
    t.integer  "touch_blog_id"
    t.datetime "touch_modified_on"
    t.string   "touch_object_type"
  end

  add_index "mt_touch", ["touch_blog_id", "touch_object_type", "touch_modified_on"], :name => "mt_touch_blog_type"

  create_table "mt_trackback", :primary_key => "trackback_id", :force => true do |t|
    t.integer  "trackback_blog_id",                                        :null => false
    t.integer  "trackback_category_id",                     :default => 0, :null => false
    t.integer  "trackback_created_by"
    t.datetime "trackback_created_on"
    t.text     "trackback_description", :limit => 16777215
    t.integer  "trackback_entry_id",                        :default => 0, :null => false
    t.integer  "trackback_is_disabled", :limit => 1,        :default => 0
    t.integer  "trackback_modified_by"
    t.datetime "trackback_modified_on"
    t.string   "trackback_passphrase",  :limit => 30
    t.string   "trackback_rss_file"
    t.string   "trackback_title"
    t.string   "trackback_url"
  end

  add_index "mt_trackback", ["trackback_blog_id"], :name => "mt_trackback_blog_id"
  add_index "mt_trackback", ["trackback_category_id"], :name => "mt_trackback_category_id"
  add_index "mt_trackback", ["trackback_created_on"], :name => "mt_trackback_created_on"
  add_index "mt_trackback", ["trackback_entry_id"], :name => "mt_trackback_entry_id"

  create_table "mt_ts_error", :id => false, :force => true do |t|
    t.integer "ts_error_error_time",                :null => false
    t.integer "ts_error_funcid",     :default => 0, :null => false
    t.integer "ts_error_jobid",                     :null => false
    t.string  "ts_error_message",                   :null => false
  end

  add_index "mt_ts_error", ["ts_error_funcid", "ts_error_error_time"], :name => "mt_ts_error_funcid_time"
  add_index "mt_ts_error", ["ts_error_jobid"], :name => "mt_ts_error_jobid"

  create_table "mt_ts_exitstatus", :primary_key => "ts_exitstatus_jobid", :force => true do |t|
    t.integer "ts_exitstatus_completion_time"
    t.integer "ts_exitstatus_delete_after"
    t.integer "ts_exitstatus_funcid",          :null => false
    t.integer "ts_exitstatus_status"
  end

  add_index "mt_ts_exitstatus", ["ts_exitstatus_delete_after"], :name => "mt_ts_exitstatus_delete_after"
  add_index "mt_ts_exitstatus", ["ts_exitstatus_funcid"], :name => "mt_ts_exitstatus_funcid"

  create_table "mt_ts_funcmap", :primary_key => "ts_funcmap_funcid", :force => true do |t|
    t.string "ts_funcmap_funcname", :null => false
  end

  add_index "mt_ts_funcmap", ["ts_funcmap_funcname"], :name => "mt_ts_funcmap_funcname", :unique => true

  create_table "mt_ts_job", :primary_key => "ts_job_jobid", :force => true do |t|
    t.binary  "ts_job_arg",           :limit => 16777215
    t.string  "ts_job_coalesce"
    t.integer "ts_job_funcid",                            :null => false
    t.integer "ts_job_grabbed_until",                     :null => false
    t.integer "ts_job_insert_time"
    t.integer "ts_job_priority"
    t.integer "ts_job_run_after",                         :null => false
    t.string  "ts_job_uniqkey"
  end

  add_index "mt_ts_job", ["ts_job_funcid", "ts_job_coalesce"], :name => "mt_ts_job_funccoal"
  add_index "mt_ts_job", ["ts_job_funcid", "ts_job_priority"], :name => "mt_ts_job_funcpri"
  add_index "mt_ts_job", ["ts_job_funcid", "ts_job_run_after"], :name => "mt_ts_job_funcrun"
  add_index "mt_ts_job", ["ts_job_funcid", "ts_job_uniqkey"], :name => "mt_ts_job_uniqfunc", :unique => true

end
