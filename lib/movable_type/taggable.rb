module MovableType::Taggable
  def self.included(base)
    base.extend(ClassMethods)
    base.module_eval do
      def self.included(new_base)
        super
      end
    end
  end
  
  def render_tag(name, tag_binding)
    send "tag:#{name.downcase}", tag_binding
  end
  
  def tags
    Util.tags_in_array(methods)
  end
  
  
  module ClassMethods
    def tag(name, &block)
        define_method("tag:#{name.downcase}", &block)
    end
    
    def tags
      Util.tags_in_array(self.instance_methods)
    end
    
  end
  
  module Util
    def self.tags_in_array(array)
      array.grep(/^tag:/).map { |name| name[4..-1] }.sort
    end
  end
end