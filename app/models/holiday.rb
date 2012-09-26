class Holiday < ActiveRecord::Base
  attr_accessible :date, :event
  validate :holiday_cannot_be_on_weekends, on: :create
  # if holiday date is already present, it gives error message
  validates_uniqueness_of :date, message: "Holiday is already present in list"
  # Admin should enter event textfield, it mustn't blank
  validates_presence_of :event, message: "Event must not be blank"

  scope :yeardate, conditions: ['year(date) = ?', Time.now.year]

  # while inserting holiday, it should not be on weekends
  def holiday_cannot_be_on_weekends
    if (self.date.strftime("%u") == "6" or self.date.strftime("%u") == "7")
      errors.add(:date, "Holiday should not be on weekends")
    end
  end

end
