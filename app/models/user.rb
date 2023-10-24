class User < ApplicationRecord
  has_many :properties, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :order_items, dependent: :destroy
  enum role: {
    customer: "customer",
    admin: "admin",
  }

  after_initialize do
    if self.new_record?
      self.role ||= :admin
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
