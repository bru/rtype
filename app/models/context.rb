class Context < Radius::Context
  attr_reader :template
  
  def initialize(template)
    super()
    @template = template
    globals.template = @template
    globals.blog = @template.blog
    template.tags.each do |name|
      define_tag(name.downcase) { |tag_binding| template.render_tag(name.downcase, tag_binding) }
    end
  end
  
  def render_tag(name, attributes = {}, &block)
    name = name.downcase
    binding = @tag_binding_stack.last
    locals = binding ? binding.locals : globals
    set_process_variables(locals.template)
    super
  rescue Exception => e
    raise e if raise_errors?
    @tag_binding_stack.pop unless @tag_binding_stack.last == binding
    render_error_message(e.message)
  end
  
  def tag_missing(name, attributes = {}, &block)
    super
  rescue Radius::UndefinedTagError => e
    raise TemplateTags::TagError.new(e.message)
  end
  
  private
  
    def render_error_message(message)
      "<div><strong>#{message}</strong></div>"
    end
    
    def set_process_variables(template)
      template.request ||= @template.request
      template.response ||= @template.response
    end
    
    def raise_errors?
      RAILS_ENV != 'production'
    end
end