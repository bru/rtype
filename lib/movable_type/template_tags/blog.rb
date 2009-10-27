# Blog tags
MovableType::TemplateTags::tag 'blogid' do |tag|
 tag.globals.blog.id.to_s
end

MovableType::TemplateTags::tag 'blogurl' do |tag|
 tag.globals.blog.site_url
end