class BusinessCompanyAbility
  include CanCan::Ability

  def initialize(user)
    # Basic user abilities
   
    can :read, :all
  end
end