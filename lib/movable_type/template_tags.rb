module MovableType::TemplateTags
  include MovableType::Taggable

  load File.dirname(__FILE__) + "/template_tags/blog.rb"
  load File.dirname(__FILE__) + "/template_tags/entry.rb"
  load File.dirname(__FILE__) + "/template_tags/logic.rb"  
  load File.dirname(__FILE__) + "/template_tags/misc.rb"
  class TagError < StandardError; end
  
  # Generic attribute accessor tags
  %w( Asset Author Blog Comment Entry Tag Trackback).each do |entity| 
    entity.constantize.tag_methods.each do |attribute|
      tag_attribute = attribute.downcase
      MovableType::TemplateTags::tag entity.downcase + tag_attribute do |tag|
       element = tag.globals.send entity.downcase
       element.send attribute.underscore
       #tag.apply_filters(tag.attr['filter'])
      end
    end
  end

end


