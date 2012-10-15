class Holiday < ActiveRecord::Base
  attr_accessible :date, :event
  validate :holiday_cannot_be_on_weekends, on: :create
  # if holiday date is already present, it gives error message
  validates_uniqueness_of :date, message: "Holiday is already present in list"
  # Admin should enter event textfield, it mustn't blank
  validates_presence_of :event, message: "Event must not be blank"

  if ActiveRecord::Base.connection.is_a?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
    scope :yeardate, conditions: ['extract(year from date) = ?', Time.now.year]
  elsif ActiveRecord::Base.connection.is_a?(ActiveRecord::ConnectionAdapters::MySQLAdapter)
    scope :yeardate, conditions: ['year(date) = ?', Time.now.year]
  end

  # while inserting holiday, it should not be on weekends
  def holiday_cannot_be_on_weekends
      if (self.date.cwday == 6 or self.date.cwday == 7)
        errors.add(:date, "Holiday should not be on weekends")
      end
  end
end
