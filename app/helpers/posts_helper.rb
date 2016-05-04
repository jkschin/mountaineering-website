module PostsHelper
	def is_admin?
	  if current_user && current_user.admin?
	    true
	  else
	    render :text => 'Admins only :)'
	  end
	end

	def get_first_image(content)
		doc = Nokogiri::HTML( content )
		img_srcs = doc.css('img').map{ |i| i['src'] }
		return img_srcs[0]
	end
	
end
