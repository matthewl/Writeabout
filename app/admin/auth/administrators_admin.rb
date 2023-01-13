Trestle.resource(:administrators, model: Administrator, scope: Auth) do
  remove_action :new
  remove_action :destroy
  remove_action :update

  menu do
    group :configuration, priority: :last do
      item :administrators, icon: "fas fa-users"
    end
  end

  table do
    column :avatar, header: false do |administrator|
      avatar_for(administrator)
    end
    column :email, link: true
    column :first_name
    column :last_name
    actions do |a|
      a.delete unless a.instance == current_user
    end
  end

  form do |administrator|
    text_field :email, readonly: instance.persisted?

    row do
      col(sm: 6) { text_field :first_name, readonly: instance.persisted? }
      col(sm: 6) { text_field :last_name, readonly: instance.persisted? }
    end
  end
end
