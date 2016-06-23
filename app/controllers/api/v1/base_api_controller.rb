class Api::V1::BaseApiController <  ActionController::Base
	include ActionController::Helpers
	include ActionController::Redirecting
	include ActionController::Rendering
	include ActionController::Renderers::All
  	include ActionController::ConditionalGet
  	include ActionController::MimeResponds

  	include ActionController::Caching
    #include ActionController::Renderers::All
    #include ActionController::ConditionalGet
    include ActionController::ParamsWrapper

    #include ActionController::MimeResponds
    include ActionController::RequestForgeryProtection
    include AbstractController::Callbacks

    include ActionController::Instrumentation
    include ActionController::Rescue

    #Rails.application.routes.default_url_options = ActionMailer::Base.default_url_options
    include Rails.application.routes.url_helpers

    


    ActiveSupport.run_load_hooks(:action_controller, self)
  
  	include ActionView::Layouts

  

    protect_from_forgery
    # Other Available Modules


    #	include ActionController::RequestForgeryProtection
  	#include ActionController::ForceSSL
  	#include ActionController::Instrumentation
  	#include AbstractController::Callbacks
  	#include ActionController::ParamsWrapper
  #	include ActionController::ImplicitRender
  #	include ActionController::Cookies
#  	include ActionController::Flash
  #	include ActionController::RecordIdentifier
  #	include ActionController::Rescue
  #	include AbstractController::Rendering
 # 	 include ActionController::RackDelegation
  #include ActionController::StrongParameters
  	#include Devise::Controller::Helpers
  #	include AbstractController::Helpers
  	#include Devise::Controllers::Helpers
  #	include Rails.application.routes.url_helpers
  #	include ActionController::EtagWithTemplateDigest
  	#include ActionController::RackDelegation
  	#include ActionController::Caching
  #include ActionController::UrlFor
  	#include ActionController::DataStreaming
  	#include ActionController::HttpAuthentication::Basic::ControllerMethods
  #	include ActionController::HttpAuthentication::Digest::ControllerMethods
  	#include ActionController::HttpAuthentication::Token::ControllerMethods

	  
  include Authenticable
  
  append_view_path "#{Rails.root}/app/views" # you have to specify your views location as 
	 
  wrap_parameters format: [:json]
end