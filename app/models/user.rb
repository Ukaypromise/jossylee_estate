class User < ApplicationRecord
  has_many :properties, dependent: :destroy
  enum role: {
    client: "client",
    marketer_partner: "marketer_partner",
    manager: "manager",
    director: "director",
    ceo: "ceo",
  }

  after_initialize do
    if self.new_record?
      self.role ||= :client
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
