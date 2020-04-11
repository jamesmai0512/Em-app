class Department < ApplicationRecord
    has_many :employees

    # Validation
    # https://guides.rubyonrails.org/active_record_validations.html#validations-overview
    validates :name, presence: true, uniqueness: true
end
