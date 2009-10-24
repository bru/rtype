module TemplateTags
  include MovableType::Taggable
  
  class TagError < StandardError; end
  
  tag 'blogid' do |tag|
    tag.globals.blog.id.to_s
  end
  
  tag 'blogurl' do |tag|
    tag.globals.blog.site_url
  end
  
end