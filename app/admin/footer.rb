module ActiveAdmin
  module Views
    class Footer < Component

      def build
        super :id => "footer"                                                    
        super :style => "text-align: right;font-size:101%;"                                     

        div do                                                                   
           "Copyright Unclejoy #{Date.today.year}"                                       
        end
      end

    end
  end
end