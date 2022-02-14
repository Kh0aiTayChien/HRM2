class Employee < ApplicationRecord

  enum role_id: { :admin => 1, hr: 2, leader: 3, user: 4}

  belongs_to :department, optional: true
  belongs_to :project, optional: true
  belongs_to :user

  has_many :employee_projects
  has_many :projects, through: :employee_projects

  belongs_to :role, optional: true
  has_one :employee_file
  accepts_nested_attributes_for :employee_file, allow_destroy: true

  with_options presence: true do
    validates :name, length: { minimum: 2 }
    validates :age, numericality: { in: 18..60 }
    validates :birthday
    validates :address, length: { minimum: 6 }
    validates :role_id
  end

  validates :user_id, uniqueness: true
  validates :is_pm, inclusion: { in: [0, 1] }

end
