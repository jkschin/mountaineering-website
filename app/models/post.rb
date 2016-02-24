class Post < ActiveRecord::Base
	include ActionView::Helpers::SanitizeHelper
	def content
		sanitize read_attribute(:content)
	end
end
