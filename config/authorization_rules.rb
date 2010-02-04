authorization do
  role :guest do
    has_permission_on :plugins, :to => [:index, :show]
#    has_permission_on :comments, :to => [:new, :create]
#    has_permission_on :comments, :to => [:edit, :update] do
#      if_attribute :user => is { user }
#    end
  end

  role :author do
    includes :guest
    has_permission_on :plugins, :to => [:new, :create]
#    has_permission_on :articles, :to => [:edit, :update] do
#      if_attribute :user => is { user }
#    end
  end
end
