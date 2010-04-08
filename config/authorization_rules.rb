authorization do
  role :guest do
    has_permission_on :plugins, :to => :read
    has_permission_on :releases, :to => :read
  end

  role :author do
    includes :guest

    has_permission_on :plugins, :to => :create

    has_permission_on :plugins, :to => [:update, :delete] do
      if_attribute :user => is { user }
    end

    has_permission_on :releases, :to => [:create, :delete] do
      if_permitted_to :update, :plugin
    end

  end
end

privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end
