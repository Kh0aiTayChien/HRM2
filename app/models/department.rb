class Department < ApplicationRecord
  has_many :projects
  has_many :employees
end
