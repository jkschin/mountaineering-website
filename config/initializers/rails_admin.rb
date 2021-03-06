RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    if current_user && current_user.admin?
      authenticate_user!
    else
      render :text => 'Admins only :)'
    end
  end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model Post do
    edit do
      # For RailsAdmin >= 0.5.0
      field :name
      field :title
      field :tag_list
      field :content do
        partial :trumbowyg
      end
      # For RailsAdmin < 0.5.0
      # field :description do
      #   bootstrap_wysihtml5 true
      # end
    end
  end

  # config.authorize_with do |controller|
  #   unless current_user.admin?
  #     redirect_to main_app.root_path
  #     flash[:error] = "You are not an admin"
  #   end
  # end
end
