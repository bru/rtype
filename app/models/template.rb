class Template < ActiveRecord::Base
  include MovableType
  include MovableType::Taggable
  include TemplateTags
  belongs_to :blog, :foreign_key => "template_blog_id"
  
  
  attr_accessor :request, :response
  def process(request, response)
    @request, @response = request, response
    # if layout
    #   content_type = layout.content_type.to_s.strip
    #   @response.headers['Content-Type'] = content_type unless content_type.empty?
    # end
    headers.each { |k,v| @response.headers[k] = v }
    @response.body = render
    @response.status = response_code
  end

   def render 
     lazy_initialize_parser_and_context.parse(text)
   end
   
   def headers
     # Return a blank hash that child classes can override or merge
     { }
   end
  
private
  
  def response_code 
    200
  end

  def lazy_initialize_parser_and_context
    unless @parser and @context
      @context = Context.new(self)
      @parser = Radius::Parser.new(@context, :tag_prefix => 'mt')
    end
    @parser
  end
end
