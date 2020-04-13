ActiveAdmin.register Reference do
  permit_params :name, :live, :position, :company, :photo, :html

  index do
    selectable_column
    id_column
    column :name
    column :live
    column :position
    column :company
    column :photo
    column :released_at
    actions
  end

  filter :email
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :live
      f.input :position
      f.input :company
      f.input :released_at
      f.input :html
      f.inputs "Upload" do
        f.input :photo, as: :file
        f.input :remove_photo, as: :boolean
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      #row :image do |ad|
      #  image_tag url_for(ad.image)
      #end
    end
  end
end
