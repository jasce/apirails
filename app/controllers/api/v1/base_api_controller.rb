class Api::V1::BaseApiController <  ActionController::Metal
	include AbstractController::Rendering
include ActionController::Redirecting
include ActionView::Layouts
include ActionController::Rendering
include ActionController::Renderers::All
include ActionController::MimeResponds
include ActionController::ImplicitRender
include ActionController::StrongParameters
include ActionController::RequestForgeryProtection
include ActionController::ForceSSL
include ActionController::ConditionalGet
include AbstractController::Callbacks
include Devise::Controllers::Helpers




  

  	include ActionController::Caching

   include ActionController::ParamsWrapper
   
    include Rails.application.routes.url_helpers

    


    ActiveSupport.run_load_hooks(:action_controller, self)
  
  	#include ActionView::Layouts

  

    protect_from_forgery
    # Other Available Modules


	  
  include Authenticable
  
  append_view_path "#{Rails.root}/app/views" # you have to specify your views location as 
	 
  wrap_parameters format: [:json]
end