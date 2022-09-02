class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    # def freebies
    #     # returns a collection of all the freebies for the Company
    #     Freebie.all.select do |freebie|
    #         freebie.company == self
    #     end
    # end

    # def devs
    #     # returns a collection of all the devs who collected freebies from the Company
    #     self.freebies.map do |freebie|
    #         freebie.dev
    #     end
    # end

    #### AGGREGATE METHODS ####

    # def give_freebie(dev, item_name, value)
    #     # takes a dev (an instance of the Dev class), an item_name (string), and a value as arguments, and creates a new Freebie instance associated with this company and the given dev
    #     Freebie.create(dev: dev, item_name: item_name, value: value, company: self)
    # end

    def give_freebie( dev , item_name , value )
        puts "- in give_freebie -"
        Freebie.create( 
            item_name: item_name , 
            value: value ,
            ## Foreign Keys
            company_id: self.id ,
            dev_id: dev.id             
        )
    end

    # def self.oldest_company
    #     # returns the Company instance with the earliest founding year
    #     Company.all.order(:founding_year).first
    # end

    def self.oldest_company
        tracking_the_years = []
        
        #  Company.all
        tracking_the_years = self.all.map do | that_company_instance |         
            that_company_instance.founding_year        
        end

        puts "tracking_the_years: #{tracking_the_years}"
        return tracking_the_years.min
    end
end
