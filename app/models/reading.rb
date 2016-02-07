class Reading
  include ActiveModel::Model
  attr_accessor :start_date, :end_date
  validates :start_date, :end_date, presence: true
  validates :parsed_start_date, :parsed_end_date, date: { 
    after: Date.parse('2006-09-20'),
    before: Date.today
  }
  validates :parsed_start_date, date: {
    before: Proc.new {|obj| obj.parsed_end_date }
  }
  validates :parsed_end_date, date: { 
    after: Proc.new {|obj| obj.parsed_start_date } 
  }
  validates :parsed_end_date, date: { before: Proc.new {|obj| obj.parsed_start_date + 7.days } }
  # using virtual attributes because not automatically type cast
  # to a Date object
  def parsed_start_date
    Date.parse(start_date)
  end
  def parsed_end_date
    Date.parse(end_date)
  end
end
