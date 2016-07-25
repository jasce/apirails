class Stores::PasswordsController< Devise::PasswordsController
def new
  super
end
def after_resetting_password_path_for(resource)
  '/success'
end
  
end