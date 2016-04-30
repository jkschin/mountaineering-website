module PostsHelper
	def is_admin?
	  if current_user && current_user.admin?
	    true
	  else
	    render :text => 'Admins only :)'
	  end
	end
end
