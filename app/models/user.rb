class User < ApplicationRecord
  has_many :properties, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :projects, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true


  enum role: {
    customer: "customer",
    admin: "admin",
  }

  after_initialize do
    if self.new_record?
      self.role ||= :customer
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def update_role(new_role)
    self.role = new_role
    save
  end

  def self.promotable_roles(user)
    role_hierarchy = {
      "customer" => ["admin"],
    }

    role_hierarchy[user.role] || []
  end

  def promotable_to?(new_role)
    User.promotable_roles(self).include?(new_role)
  end
end
