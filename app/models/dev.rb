class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies
    
    # def freebies
    #     # returns a collection of all the freebies that the Dev has collected
    #     Freebie.all.select do |freebie|
    #         freebie.dev == self
    #     end
    # end

    # def companies
    #     # returns a collection of all the companies that the Dev has collected freebies from
    #     Company.all.select do |company|
    #         company.freebies.include?(self)
    #     end
    # end

    #### AGGREGATE METHODS ####

    def received_one?(item_name)
        # accepts an item_name (string) and returns true if any of the freebies associated with the dev has that item_name, otherwise returns false
        self.freebies.any? do |freebie|
            freebie.item_name == item_name
        end
    end

    def give_away(dev, freebie)
        # accepts a Dev instance and a Freebie instance, changes the freebie's dev to be the given dev; your code should only make the change if the freebie belongs to the dev who's giving it away
        if freebie.dev == self
            freebie.dev = dev
        end
    end

    # def give_away(freebie, dev)
    #     freebie.update(dev: dev) unless freebie.dev != self
    # end
end
