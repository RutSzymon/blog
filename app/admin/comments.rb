ActiveAdmin.register Comment, as: "ArticleComment" do
  index do
    column :id
    column :body
    column :user
    column :created_at
    column :updated_at
    default_actions
  end

end
