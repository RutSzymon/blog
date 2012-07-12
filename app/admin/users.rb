ActiveAdmin.register User do
  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :surname
    end
    f.buttons
  end
end