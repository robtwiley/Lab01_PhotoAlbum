#File required by declarative_authorization to know roles and rights

authorization do

    role :guest do
	  has_permission_on [ :albums, :photos ], :to => [ :index, :show ]
	  has_permission_on :users, :to => [ :new, :create ]
	  has_permission_on :user_sessions, :to => [ :new, :create ] #login
	end
	
	role :administrator do
	  has_permission_on [ :albums, :photos, :users, :roles], :to => [ :index, :show, :new, :create, :edit, :update, :destroy ]
	  has_permission_on :user_sessions, :to => [ :destroy ] #logout
	end
	
	role :user do
	  includes :guest
	  has_permission_on [ :albums, :photos], :to => [ :new, :create, :edit, :update, :destroy ] do
	    if_attribute :id => is { user.id }
	  end
	  has_permission_on :users, :to => [ :edit, :update ] do
	    if_attribute :id => is { user.id }
	  end
	  #logout
	  has_permission_on :user_sessions, :to => [ :destroy ] 
	end
	
	role :moderator do
	  includes :guest
	  includes :user
	  has_permission_on [ :albums, :photos ], :to => [ :show, :new, :create, :edit, :update ]
	end
end