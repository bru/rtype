# Blog tags

%w(ArchiveUrl id name description language SitePath url ).each do |attribute|
  attribute = attribute.underscore.downcase
  MovableType::TemplateTags::tag 'blog' + attribute do |tag|
   blog = tag.globals.blog
   blog.send attribute
  end
end

