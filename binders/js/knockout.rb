module Rboxy
  module Binders
    class Knockout
      
      attr_accessor :html_attr, :css, :js
     #ini
      def initialize command obj
        @html = []
        @css =  []
        @js = []
        @html_attr = ''
        @command = command
        @obj = obj
      end

      def bind 
        interpret_string
        return self
      end
      
      def interpret_string 
        #matching strings starting with a ko binder
        t = @command.match(/(\A[a-zA-Z]{2,12}):\s([a-zA-Z]+)/)
        @html_attr = "data-bind=\"@command\""
        if t == nil
          return @command
          #just give back string
        else
          case t[1].to_s
          when 'foreach'
            model = t[2].to_s             
          when 'if'
          when 'text'
          when 'html'
          end
        end
      end

      private

      def observable value
        @js << "var #{value} = ko.observable();"
      end

      def observable_array model       
        @js << "var #{model} = ko.observableArray([]);" 
        @js << "ko.applyBindings(#{model},document.getElementById('#{@obj[:id]}'));"
        @js <<  %Q<
          $.getJSON("/#{model.downcase}", function(response){
              $.each(response.#{model}, function(obj,ind){
                  #{model}.push(obj)
              })             
          })
        >   
      end

      def binders
        %w{ foreach if ifnot with text attr visible html }
      end

      
    end
  end
end
