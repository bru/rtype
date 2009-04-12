module MovableType
  
  def self.included(recipient)
    recipient.extend(ModelClassMethods)
    recipient.class_eval do
      set_primary_key self.to_s.downcase + "_id" 
      self.column_names.each do |attrib|
        new_attrib = attrib.sub(self.to_s.downcase + "_", "")
        unless new_attrib == "class" or new_attrib == "password"
          self.send :alias_attribute, new_attrib.to_sym, attrib.to_sym
        end
      end
      
      include ModelInstanceMethods
    end
  end
  
  module ModelClassMethods
  end
  
  module ModelInstanceMethods
  end # instance methods
end
