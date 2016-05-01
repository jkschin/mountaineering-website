require 'rails_admin/config/fields/base'
module RailsAdmin
  module Config
    module Fields
      module Types
        class Trumbowyg < RailsAdmin::Config::Fields::Types::Text
          RailsAdmin::Config::Fields::Type.register(self)

          register_instance_option :config_option do
            nil
          end

          register_instance_option :css_location do
            ActionController::Base.helpers.asset_path('trumbowyg.min.css')
          end

          register_instance_option :js_location do
            ActionController::Base.helpers.asset_path('trumbowyg.min.js')
          end

          register_instance_option :partial do
            :form_trumbowyg
          end

          [:config_options, :css_location, :js_location].each do |key|
            register_deprecated_instance_option :"trumbowyg_#{key}", key
          end

        end
      end
    end
  end
end
