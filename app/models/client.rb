class Client < ApplicationRecord
    has_many :pets,  dependent: :destroy
    accepts_nested_attributes_for :pets  

    has_many :histories, dependent: :destroy
    accepts_nested_attributes_for :histories

    def to_s
      name
    end

    def pets_count
        self.pets.count
    end

    def max_weight
        self.histories.maximum(:weight)
      end
        
      def max_height
        self.histories.maximum(:height)
      end

end
