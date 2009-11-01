module MovableType
  
  def self.included(recipient)
    
    recipient.extend(ModelClassMethods)
    recipient.class_eval do
      set_table_name 'mt_' + self.to_s.downcase
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
    def tag_methods
      # generic attributes, if any
      []
    end
    
    def column_methods_hash #:nodoc:
      @dynamic_methods_hash ||= column_names.inject(Hash.new(false)) do |methods, attr|

#        attr_final = movable_type_field_names ? attr.sub(self.to_s.downcase + "_", "") : attr
        attr_final = attr.sub(self.to_s.downcase + "_", "") 
        attr_name = attr_final
        methods[attr_final.to_sym]       = attr
        methods["#{attr_final}=".to_sym] = attr
        methods["#{attr_final}?".to_sym] = attr
        methods["#{attr_final}_before_type_cast".to_sym] = attr
        methods
      end
    end
    

    def construct_finder_sql(options)
      # if options[:conditions]
      #   options[:condi]
      
      custom_aliases= { 'login' => 'name' }
      sql = super
      
      new_sql = []
      puts "FINDER: working on #{sql}"
      for token in sql.split(' ')
         new_sql << token && next if %w(SELECT * FROM WHERE LIMIT GROUP BY UPDATE ORDER).include?(token)
         token_attr = nil
         token_class = self.to_s.downcase
         token_match = token.match(/^(\()?(`?[^@`\s\.]+`?\.)?`?([^\.\s<>='`]+)`?([\!<>=]+)?/)
         if token_match 
          puts "MATCH: #{token_match[3]} and class #{token_match[2]}"
           token_class = token_match[2].match(/`?mt_([^\.\`]+)`?/)[1] if token_match[2] and token_match[2].match(/`?mt_([^\.\`]+)`?/)
           token_aliased_attr = custom_aliases[token_match[3]] ? custom_aliases[token_match[3]] : token_match[3]
           token_attr = token_class + "_" + token_aliased_attr if token_class && token_class.classify.constantize.column_names.include?(token_class + '_' + token_aliased_attr)
         end
         if token_attr
           #puts "YAY! Got #{token_attr}"
           new_sql << token_match[1].to_s + token_match[2].to_s + token_attr + token_match[4].to_s
         else 
           new_sql << token
         end
      end
      sql = new_sql.join(' ')
 #        else        conditions.gsub!(/\s?([^\s\.]+\.)?([^\s<>=]+)([\s<>=\!]?)/, ' \1' + self.to_s.downcase + '_\2\3')
      sql
    end
  end
  
  module ModelInstanceMethods

  end # instance methods
end
