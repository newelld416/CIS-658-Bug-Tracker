class Bug < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true

    enum issue_type_options: %i[Issue Enhancement Feature]
    validates :issue_type, inclusion: { in: issue_type_options }

    enum priority_options: %i[Low Medium High]
    validates :priority, inclusion: { in: priority_options }

    enum status_options: %i[Open Closed Monitor]
    validates :status, inclusion: { in: status_options }

    belongs_to :user
end
