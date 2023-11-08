class PagesController < ApplicationController
  def home
    @properties = Property.order(created_at: :desc).limit(3)
  end

  def about
  end

end
