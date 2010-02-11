authorization do
  role :guest do
    has_permission_on :plugins, :to => [:index, :show]
  end

  role :author do
    includes :guest

    has_permission_on :plugins, :to => [:new, :create]

    has_permission_on :plugins, :to => [:update, :delete] do
      if_attribute :user => is { user }
    end

    has_permission_on :releases, :to => [:new, :create] do
      if_permitted_to :update, :plugin
    end
  end

end
