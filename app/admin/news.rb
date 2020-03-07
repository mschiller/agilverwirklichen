ActiveAdmin.register News do
  permit_params :title, :live, :short_description, :description, :start_datetime, :end_datetime

  index do
    selectable_column
    id_column
    column :name
    column :start_datetime
    column :end_datetime
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :short_description
      f.input :description
      f.inputs "Timebox" do
        f.input :start_datetime
        f.input :end_datetime
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      #row :image do |ad|
      #  image_tag url_for(ad.image)
      #end
    end
  end

end
