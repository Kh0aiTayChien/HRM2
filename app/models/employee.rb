class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :department, optional: true
  belongs_to :project, optional: true
  has_many :projects, through: :employee_projects
  has_many :employee_projects
  belongs_to :rank
  has_one :employee_file
  accepts_nested_attributes_for :employee_file

end
