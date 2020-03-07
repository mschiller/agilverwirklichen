ActiveAdmin.register Teaser do
  permit_params :name, :live, :description, :image, :html

  index do
    selectable_column
    id_column
    column :name
    column :live
    column :created_at
    actions
  end

  filter :email
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :live
      f.input :description
      f.inputs "Upload" do
        f.input :image, as: :file
        f.input :delete_image, as: :boolean
      end
      f.input :html
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
