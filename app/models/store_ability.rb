class StoreAbility
  include CanCan::Ability

  def initialize(user)
    # Basic user abilities
    can :update, Store
    can :create, Store
    
  end
end