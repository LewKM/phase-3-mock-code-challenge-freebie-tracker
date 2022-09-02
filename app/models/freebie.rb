class Freebie < ActiveRecord::Base
    belongs_to :company
    belongs_to :dev

    def dev
        # returns the Dev instance for this Freebie
        Freebie.all.select do |freebie|
            freebie.dev == self
        end
    end

    def company
        # returns the Company instance for this Freebie
        Freebie.all.select do |freebie|
            freebie.company == self
        end
    end

    #### AGGREGATE METHODS ####

    def print_details
        # should return a string formatted as follows: {insert dev's name} owns a {insert freebie's item_name} from {insert company's name}
        "#{self.dev.name} owns a #{self.item_name} from #{self.company.name}"
    end


end
