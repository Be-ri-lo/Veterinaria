class History < ApplicationRecord
    belongs_to :pet
    belongs_to :client

    def to_s
        name
    end
end
