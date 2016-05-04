class Ability
	 include CanCan::Ability

	def initialize(user)
		if user.class ==User
      # add admin permissions only
      		can :update, User
   		 elsif user.is_a?(Store)
      # add user permissions only
      		 can :update, Store
    		can :create, Store
   		 else
      # add guest permissions only
       can :read, :all
   		 end
	end

end
