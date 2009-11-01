# Logic tags
MovableType::TemplateTags::tag 'ignore' do |tag|
  # ...
end

MovableType::TemplateTags::tag 'var' do |tag|
end

MovableType::TemplateTags::tag 'include' do |tag|
  t = Template.find_by_name(tag.attr['module'])
  if (t) 
    t.render
  end
end