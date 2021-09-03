class Client < ApplicationRecord
    has_many :memberships
    has_many :gyms, through: :memberships

    attribute :total_amount_memberships

    def total_amount_memberships
        self.memberships.sum(&:charge)
    end
end
