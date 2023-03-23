ActiveAdmin.register Article do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :body
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body, :status]
    # permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  before_save do |a|
    a.body.html_safe
  end

  index do
    selectable_column
    id_column
    column :title
    column :body do |b|
      b.body.html_safe
    end
    column :actions do |item|
      links = []
      links << link_to('View', admin_article_path(item), class: "acc_link")
      links << link_to('Delete', admin_article_path(item), class:  "acc_del_link", method: :delete, :data => {confirm: 'Are you sure you want to delete?'})
      links.join(' ').html_safe
    end
  end

  form do |f|
    f.inputs 'Article' do
      f.input :title
      f.input :body, as: :quill_editor
    end
    f.actions
  end

  show do |arti|
    attributes_table do
      row :title
      row :body do |td|
        td.body.html_safe
      end
    end
  end

end
