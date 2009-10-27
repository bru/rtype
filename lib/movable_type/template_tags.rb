module MovableType::TemplateTags
  include MovableType::Taggable

  load File.dirname(__FILE__) + "/template_tags/blog.rb"
  load File.dirname(__FILE__) + "/template_tags/entry.rb"
  load File.dirname(__FILE__) + "/template_tags/logic.rb"  
  class TagError < StandardError; end


end


