Trestle.resource(:properties) do
  menu do
    item :properties, icon: "fa fa-star"
  end

  search do |query|
    if query
      Property.where("name ILIKE ?", "%#{query}%")
    else
      Property.all
    end
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.

  # form do |property|
  #   text_field :name

  #   col do
  #     col {text_area :description}
  #     col {text_field :property_type}
  #     col {text_field :location}
  #     col {number_field :price}
  #     col {number_field :plot_size}
  #     col {text_field :property_status}
  #     col {date_field :availability}
  #     col {text_field :owner_agent}
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:property).permit(:name, ...)
  # end
end
