class Project < ApplicationRecord
    has_many :employees
    validates :code, presence: true, uniqueness: true
    validates :budget, presence: true, uniqueness: true
end
