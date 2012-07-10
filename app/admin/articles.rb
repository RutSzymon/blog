ActiveAdmin.register Article do
  form do |f|
    f.inputs do
      f.input :category
      f.input :title
      f.input :summary
      f.input :body
      f.input :tag_list
    end
    f.buttons
  end

  index do
    column :id
    column :title
    column :body
    column :tag_list
    column :created_at
    column :updated_at
    default_actions
  end

end
