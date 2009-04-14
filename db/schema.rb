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

ActiveRecord::Schema.define(:version => 0) do

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
    t.binary   "asset_meta",        :limit => 16777215
    t.string   "asset_mime_type"
    t.integer  "asset_modified_by"
    t.datetime "asset_modified_on"
    t.integer  "asset_parent"
    t.string   "asset_url"
  end

  add_index "mt_asset", ["asset_blog_id"], :name => "mt_asset_blog_id"
  add_index "mt_asset", ["asset_class"], :name => "mt_asset_class"
  add_index "mt_asset", ["asset_created_by"], :name => "mt_asset_created_by"
  add_index "mt_asset", ["asset_created_on"], :name => "mt_asset_created_on"
  add_index "mt_asset", ["asset_file_path"], :name => "mt_asset_file_path"
  add_index "mt_asset", ["asset_label"], :name => "mt_asset_label"
  add_index "mt_asset", ["asset_parent"], :name => "mt_asset_parent"
  add_index "mt_asset", ["asset_url"], :name => "mt_asset_url"

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
    t.string   "author_auth_type"
    t.integer  "author_can_create_blog",      :limit => 1
    t.integer  "author_can_view_log",         :limit => 1
    t.integer  "author_created_by"
    t.datetime "author_created_on"
    t.string   "author_email",                :limit => 75
    t.string   "author_entry_prefs"
    t.string   "author_external_id"
    t.string   "author_hint",                 :limit => 75
    t.integer  "author_is_superuser",         :limit => 1
    t.binary   "author_meta",                 :limit => 16777215
    t.integer  "author_modified_by"
    t.datetime "author_modified_on"
    t.string   "author_name",                                     :default => "", :null => false
    t.string   "author_nickname"
    t.string   "author_password",             :limit => 60,       :default => "", :null => false
    t.string   "author_preferred_language",   :limit => 50
    t.text     "author_public_key",           :limit => 16777215
    t.string   "author_remote_auth_token",    :limit => 50
    t.string   "author_remote_auth_username", :limit => 50
    t.integer  "author_status",                                   :default => 1
    t.string   "author_text_format",          :limit => 30
    t.integer  "author_type",                 :limit => 2,        :default => 1,  :null => false
    t.string   "author_url"
  end

  add_index "mt_author", ["author_auth_type"], :name => "mt_author_auth_type"
  add_index "mt_author", ["author_created_on"], :name => "mt_author_created_on"
  add_index "mt_author", ["author_email"], :name => "mt_author_email"
  add_index "mt_author", ["author_external_id"], :name => "mt_author_external_id"
  add_index "mt_author", ["author_name"], :name => "mt_author_name"
  add_index "mt_author", ["author_status"], :name => "mt_author_status"
  add_index "mt_author", ["author_type"], :name => "mt_author_type"

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
    t.binary   "blog_meta",                      :limit => 16777215
    t.integer  "blog_moderate_pings",            :limit => 1
    t.integer  "blog_moderate_unreg_comments",   :limit => 1
    t.integer  "blog_modified_by"
    t.datetime "blog_modified_on"
    t.string   "blog_mt_update_key",             :limit => 30
    t.string   "blog_name",                                          :default => "",     :null => false
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

  add_index "mt_blog", ["blog_children_modified_on"], :name => "mt_blog_children_modified_on"
  add_index "mt_blog", ["blog_name"], :name => "mt_blog_name"

  create_table "mt_category", :primary_key => "category_id", :force => true do |t|
    t.integer  "category_allow_pings", :limit => 1,        :default => 0
    t.integer  "category_author_id"
    t.string   "category_basename"
    t.integer  "category_blog_id",                                                 :null => false
    t.string   "category_class",                           :default => "category"
    t.integer  "category_created_by"
    t.datetime "category_created_on"
    t.text     "category_description", :limit => 16777215
    t.string   "category_label",       :limit => 100,      :default => "",         :null => false
    t.integer  "category_modified_by"
    t.datetime "category_modified_on"
    t.integer  "category_parent",                          :default => 0
    t.text     "category_ping_urls",   :limit => 16777215
  end

  add_index "mt_category", ["category_basename"], :name => "mt_category_basename"
  add_index "mt_category", ["category_blog_id"], :name => "mt_category_blog_id"
  add_index "mt_category", ["category_class"], :name => "mt_category_class"
  add_index "mt_category", ["category_label"], :name => "mt_category_label"
  add_index "mt_category", ["category_parent"], :name => "mt_category_parent"

  create_table "mt_comment", :primary_key => "comment_id", :force => true do |t|
    t.string   "comment_author",        :limit => 100
    t.integer  "comment_blog_id",                                                              :null => false
    t.integer  "comment_commenter_id"
    t.integer  "comment_created_by"
    t.datetime "comment_created_on"
    t.string   "comment_email",         :limit => 75
    t.integer  "comment_entry_id",                                                             :null => false
    t.string   "comment_ip",            :limit => 16
    t.text     "comment_junk_log",      :limit => 16777215
    t.float    "comment_junk_score"
    t.integer  "comment_junk_status",   :limit => 2,        :default => 0
    t.datetime "comment_last_moved_on",                     :default => '2000-01-01 00:00:00', :null => false
    t.integer  "comment_modified_by"
    t.datetime "comment_modified_on"
    t.integer  "comment_parent_id"
    t.text     "comment_text",          :limit => 16777215
    t.string   "comment_url"
    t.integer  "comment_visible",       :limit => 1
  end

  add_index "mt_comment", ["comment_blog_id"], :name => "mt_comment_blog_id"
  add_index "mt_comment", ["comment_commenter_id"], :name => "mt_comment_commenter_id"
  add_index "mt_comment", ["comment_created_on"], :name => "mt_comment_created_on"
  add_index "mt_comment", ["comment_email"], :name => "mt_comment_email"
  add_index "mt_comment", ["comment_entry_id"], :name => "mt_comment_entry_id"
  add_index "mt_comment", ["comment_ip"], :name => "mt_comment_ip"
  add_index "mt_comment", ["comment_junk_score"], :name => "mt_comment_junk_score"
  add_index "mt_comment", ["comment_junk_status"], :name => "mt_comment_junk_status"
  add_index "mt_comment", ["comment_last_moved_on"], :name => "mt_comment_last_moved_on"
  add_index "mt_comment", ["comment_parent_id"], :name => "mt_comment_parent_id"
  add_index "mt_comment", ["comment_visible"], :name => "mt_comment_visible"

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
    t.string   "entry_convert_breaks", :limit => 30
    t.integer  "entry_created_by"
    t.datetime "entry_created_on"
    t.text     "entry_excerpt",        :limit => 16777215
    t.text     "entry_keywords",       :limit => 16777215
    t.integer  "entry_modified_by"
    t.datetime "entry_modified_on"
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
  add_index "mt_entry", ["entry_basename"], :name => "mt_entry_basename"
  add_index "mt_entry", ["entry_blog_id"], :name => "mt_entry_blog_id"
  add_index "mt_entry", ["entry_class"], :name => "mt_entry_class"
  add_index "mt_entry", ["entry_created_on"], :name => "mt_entry_created_on"
  add_index "mt_entry", ["entry_modified_on"], :name => "mt_entry_modified_on"
  add_index "mt_entry", ["entry_status"], :name => "mt_entry_status"
  add_index "mt_entry", ["entry_week_number"], :name => "mt_entry_week_number"

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

  add_index "mt_fileinfo", ["fileinfo_blog_id"], :name => "mt_fileinfo_blog_id"
  add_index "mt_fileinfo", ["fileinfo_entry_id"], :name => "mt_fileinfo_entry_id"
  add_index "mt_fileinfo", ["fileinfo_template_id"], :name => "mt_fileinfo_template_id"
  add_index "mt_fileinfo", ["fileinfo_templatemap_id"], :name => "mt_fileinfo_templatemap_id"
  add_index "mt_fileinfo", ["fileinfo_url"], :name => "mt_fileinfo_url"

  create_table "mt_ipbanlist", :primary_key => "ipbanlist_id", :force => true do |t|
    t.integer  "ipbanlist_blog_id",                                   :null => false
    t.integer  "ipbanlist_created_by"
    t.datetime "ipbanlist_created_on"
    t.string   "ipbanlist_ip",          :limit => 15, :default => "", :null => false
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
    t.string   "log_ip",          :limit => 16
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

  create_table "mt_objectasset", :primary_key => "objectasset_id", :force => true do |t|
    t.integer "objectasset_asset_id",                                :null => false
    t.integer "objectasset_blog_id"
    t.string  "objectasset_object_ds", :limit => 50, :default => "", :null => false
    t.integer "objectasset_object_id",                               :null => false
  end

  add_index "mt_objectasset", ["objectasset_asset_id"], :name => "mt_objectasset_asset_id"
  add_index "mt_objectasset", ["objectasset_blog_id"], :name => "mt_objectasset_blog_id"
  add_index "mt_objectasset", ["objectasset_object_ds"], :name => "mt_objectasset_object_ds"
  add_index "mt_objectasset", ["objectasset_object_id"], :name => "mt_objectasset_object_id"

  create_table "mt_objectscore", :primary_key => "objectscore_id", :force => true do |t|
    t.integer  "objectscore_author_id",                 :default => 0
    t.integer  "objectscore_created_by"
    t.datetime "objectscore_created_on"
    t.integer  "objectscore_modified_by"
    t.datetime "objectscore_modified_on"
    t.string   "objectscore_namespace",                 :default => "", :null => false
    t.string   "objectscore_object_ds",   :limit => 50, :default => "", :null => false
    t.integer  "objectscore_object_id",                 :default => 0
    t.float    "objectscore_score"
  end

  add_index "mt_objectscore", ["objectscore_author_id"], :name => "mt_objectscore_author_id"
  add_index "mt_objectscore", ["objectscore_namespace"], :name => "mt_objectscore_namespace"
  add_index "mt_objectscore", ["objectscore_object_id"], :name => "mt_objectscore_object_id"

  create_table "mt_objecttag", :primary_key => "objecttag_id", :force => true do |t|
    t.integer "objecttag_blog_id"
    t.string  "objecttag_object_datasource", :limit => 50, :default => "", :null => false
    t.integer "objecttag_object_id",                                       :null => false
    t.integer "objecttag_tag_id",                                          :null => false
  end

  add_index "mt_objecttag", ["objecttag_blog_id"], :name => "mt_objecttag_blog_id"
  add_index "mt_objecttag", ["objecttag_object_datasource"], :name => "mt_objecttag_object_datasource"
  add_index "mt_objecttag", ["objecttag_object_id"], :name => "mt_objecttag_object_id"
  add_index "mt_objecttag", ["objecttag_tag_id"], :name => "mt_objecttag_tag_id"

  create_table "mt_permission", :primary_key => "permission_id", :force => true do |t|
    t.integer  "permission_author_id",                          :default => 0, :null => false
    t.integer  "permission_blog_id",                            :default => 0, :null => false
    t.string   "permission_blog_prefs"
    t.integer  "permission_created_by"
    t.datetime "permission_created_on"
    t.string   "permission_entry_prefs"
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

  add_index "mt_placement", ["placement_blog_id"], :name => "mt_placement_blog_id"
  add_index "mt_placement", ["placement_category_id"], :name => "mt_placement_category_id"
  add_index "mt_placement", ["placement_entry_id"], :name => "mt_placement_entry_id"
  add_index "mt_placement", ["placement_is_primary"], :name => "mt_placement_is_primary"

  create_table "mt_plugindata", :primary_key => "plugindata_id", :force => true do |t|
    t.binary "plugindata_data",   :limit => 16777215
    t.string "plugindata_key",                        :default => "", :null => false
    t.string "plugindata_plugin", :limit => 50,       :default => "", :null => false
  end

  add_index "mt_plugindata", ["plugindata_key"], :name => "mt_plugindata_key"
  add_index "mt_plugindata", ["plugindata_plugin"], :name => "mt_plugindata_plugin"

  create_table "mt_profile_field", :primary_key => "profile_field_id", :force => true do |t|
    t.integer "profile_field_author_id",                 :null => false
    t.string  "profile_field_name",      :default => "", :null => false
    t.string  "profile_field_value"
  end

  create_table "mt_profile_follow", :primary_key => "profile_follow_id", :force => true do |t|
    t.integer  "profile_follow_created_by"
    t.datetime "profile_follow_created_on"
    t.integer  "profile_follow_follower_id", :null => false
    t.integer  "profile_follow_follows_id",  :null => false
    t.integer  "profile_follow_modified_by"
    t.datetime "profile_follow_modified_on"
  end

  add_index "mt_profile_follow", ["profile_follow_follower_id"], :name => "mt_profile_follow_follower_id"
  add_index "mt_profile_follow", ["profile_follow_follows_id"], :name => "mt_profile_follow_follows_id"

  create_table "mt_role", :primary_key => "role_id", :force => true do |t|
    t.integer  "role_created_by"
    t.datetime "role_created_on"
    t.text     "role_description", :limit => 16777215
    t.integer  "role_is_system",   :limit => 1,        :default => 0
    t.integer  "role_modified_by"
    t.datetime "role_modified_on"
    t.string   "role_name",                            :default => "", :null => false
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
    t.string  "tag_name",                    :default => "", :null => false
  end

  add_index "mt_tag", ["tag_is_private"], :name => "mt_tag_is_private"
  add_index "mt_tag", ["tag_n8d_id"], :name => "mt_tag_n8d_id"
  add_index "mt_tag", ["tag_name"], :name => "mt_tag_name"

  create_table "mt_tbping", :primary_key => "tbping_id", :force => true do |t|
    t.integer  "tbping_blog_id",                                                              :null => false
    t.string   "tbping_blog_name"
    t.integer  "tbping_created_by"
    t.datetime "tbping_created_on"
    t.text     "tbping_excerpt",       :limit => 16777215
    t.string   "tbping_ip",            :limit => 15,       :default => "",                    :null => false
    t.text     "tbping_junk_log",      :limit => 16777215
    t.float    "tbping_junk_score"
    t.integer  "tbping_junk_status",   :limit => 2,        :default => 0,                     :null => false
    t.datetime "tbping_last_moved_on",                     :default => '2000-01-01 00:00:00', :null => false
    t.integer  "tbping_modified_by"
    t.datetime "tbping_modified_on"
    t.string   "tbping_source_url"
    t.integer  "tbping_tb_id",                                                                :null => false
    t.string   "tbping_title"
    t.integer  "tbping_visible",       :limit => 1
  end

  add_index "mt_tbping", ["tbping_blog_id"], :name => "mt_tbping_blog_id"
  add_index "mt_tbping", ["tbping_created_on"], :name => "mt_tbping_created_on"
  add_index "mt_tbping", ["tbping_ip"], :name => "mt_tbping_ip"
  add_index "mt_tbping", ["tbping_junk_score"], :name => "mt_tbping_junk_score"
  add_index "mt_tbping", ["tbping_junk_status"], :name => "mt_tbping_junk_status"
  add_index "mt_tbping", ["tbping_last_moved_on"], :name => "mt_tbping_last_moved_on"
  add_index "mt_tbping", ["tbping_tb_id"], :name => "mt_tbping_tb_id"
  add_index "mt_tbping", ["tbping_visible"], :name => "mt_tbping_visible"

  create_table "mt_template", :primary_key => "template_id", :force => true do |t|
    t.integer  "template_blog_id",                                               :null => false
    t.integer  "template_build_dynamic",     :limit => 1,        :default => 0
    t.integer  "template_created_by"
    t.datetime "template_created_on"
    t.string   "template_identifier",        :limit => 50
    t.string   "template_linked_file"
    t.string   "template_linked_file_mtime", :limit => 10
    t.integer  "template_linked_file_size"
    t.binary   "template_meta",              :limit => 16777215
    t.integer  "template_modified_by"
    t.datetime "template_modified_on"
    t.string   "template_name",                                  :default => "", :null => false
    t.string   "template_outfile"
    t.integer  "template_rebuild_me",        :limit => 1,        :default => 1
    t.text     "template_text",              :limit => 16777215
    t.string   "template_type",              :limit => 25,       :default => "", :null => false
  end

  add_index "mt_template", ["template_blog_id"], :name => "mt_template_blog_id"
  add_index "mt_template", ["template_build_dynamic"], :name => "mt_template_build_dynamic"
  add_index "mt_template", ["template_identifier"], :name => "mt_template_identifier"
  add_index "mt_template", ["template_name"], :name => "mt_template_name"
  add_index "mt_template", ["template_outfile"], :name => "mt_template_outfile"
  add_index "mt_template", ["template_type"], :name => "mt_template_type"

  create_table "mt_templatemap", :primary_key => "templatemap_id", :force => true do |t|
    t.string  "templatemap_archive_type",  :limit => 25, :default => "", :null => false
    t.integer "templatemap_blog_id",                                     :null => false
    t.string  "templatemap_file_template"
    t.integer "templatemap_is_preferred",  :limit => 1
    t.integer "templatemap_template_id",                                 :null => false
  end

  add_index "mt_templatemap", ["templatemap_archive_type"], :name => "mt_templatemap_archive_type"
  add_index "mt_templatemap", ["templatemap_blog_id"], :name => "mt_templatemap_blog_id"
  add_index "mt_templatemap", ["templatemap_is_preferred"], :name => "mt_templatemap_is_preferred"
  add_index "mt_templatemap", ["templatemap_template_id"], :name => "mt_templatemap_template_id"

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
    t.integer "ts_error_error_time",                 :null => false
    t.integer "ts_error_funcid",     :default => 0,  :null => false
    t.integer "ts_error_jobid",                      :null => false
    t.string  "ts_error_message",    :default => "", :null => false
  end

  add_index "mt_ts_error", ["ts_error_error_time"], :name => "mt_ts_error_error_time"
  add_index "mt_ts_error", ["ts_error_funcid"], :name => "mt_ts_error_funcid"
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
    t.string "ts_funcmap_funcname", :default => "", :null => false
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

  add_index "mt_ts_job", ["ts_job_coalesce"], :name => "mt_ts_job_coalesce"
  add_index "mt_ts_job", ["ts_job_funcid", "ts_job_uniqkey"], :name => "mt_ts_job_uniqfunc", :unique => true
  add_index "mt_ts_job", ["ts_job_funcid"], :name => "mt_ts_job_funcid"
  add_index "mt_ts_job", ["ts_job_run_after"], :name => "mt_ts_job_run_after"
  add_index "mt_ts_job", ["ts_job_uniqkey"], :name => "mt_ts_job_uniqkey"

end
