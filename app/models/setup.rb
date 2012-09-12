class Setup < ActiveRecord::Base
# getter & setter for total_leaves and year
attr_accessible :total_leaves, :year
# total_leaves & year must not be blank
validates_presence_of :total_leaves, :year
# total leaves should be positive integer
validates_numericality_of :total_leaves, 
                          :only_integer => true, 
                          :greater_than_or_equal_to => 0,
                          :maximum => 2,
                          :message => "Total leaves should be positive integers & must be greater than 0"
# year should be greater than 2010
validates_numericality_of :year, 
                          :only_integer => true, 
                          :greater_than_or_equal_to => 2011, 
                          :message => "Year should be 2011 or next of 2011"
# while inserting new entry, year should not be duplicated
validates_uniqueness_of :year, message: "You have already added total holidays for this year"

scope :setupbyyear, :conditions => ['year = ?', "#{Time.now.year}"]

  def self.get_remaining_leave
    remaining_leaves = self.total_leaves - @leaves_taken
    return remaining_leaves
  end

  def self.total_leave
    #connection = ActiveRecord::Base.connection();
    #query = ("select total_leaves from setups where year = '#{Time.now.year}'")

    #result = connection.execute(query)
    result = Setup.find_by_sql ("select total_leaves from setups where year = '#{Time.now.year}' ")
    #result = Setup.select("total_leaves").where(:year => "#{Time.now.year}%")

    return result
  end

end
