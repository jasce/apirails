class UserAbility
  include CanCan::Ability

  

  def initialize(user)
    # Basic user abilities
   can :read, User
   can :update, User
   can :delete, User
    can :manage, Store , :user_id => user.id
    can [:show , :create] , User
    cannot :index, Store
    cannot :index, BusinessCompany
    #cannot :index, User
    #can [:update,:read], [User, Store]
    #can :update, @user
    #can [:update, :destroy], [User, Store]
    

    
  end
end