class Post < ActiveRecord::Base
	include ActionView::Helpers::SanitizeHelper
  acts_as_taggable

	def content
		sanitize read_attribute(:content), attributes: %w(href style src)
	end
end
