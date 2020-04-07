class Employee < ApplicationRecord
    belongs_to :project
    belongs_to :department
    belongs_to :hourly_rate
end
