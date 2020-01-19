Trestle.resource(:prompts) do
  # Add a link to this admin in the main navigation
  menu do
    item :prompts, icon: "fa fa-pencil"
  end

  # Define custom scopes for the index view
  scopes do
    scope :all, default: true
  end

  # Define the index view table listing
  table do
    column :id, link: true
    column :prompt, truncate: false
    column :updated_at, header: "Last Updated", align: :center
    actions
  end

  # Define the form structure for the new & edit actions
  form do
    # Organize fields into tabs and sidebars
    tab :prompt do
      text_field :prompt
    end
  end
end