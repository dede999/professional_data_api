class GoodDataValidator < ActiveModel::Validator
  require 'date'

  def validate(record)
    begin
      first = Date.strptime(record.first_day, "%d/%m/%Y")
      last = Date.strptime(record.last_day, "%d/%m/%Y")

      if first > last
        record.errors[:invalid_last_day] << "You can't quit a job before you start it"
      end

    rescue ArgumentError
      record.errors[:last_day_invalid_format] << "Invalid Date Format"
    rescue TypeError
      return
    end
  end
end

class Experience < ApplicationRecord
  validates_with GoodDataValidator
  validates :title, presence: true, uniqueness: { scope: :company }
  validates :first_day, presence: true, format: {
      with: /\d{2}\/\d{2}\/\d{2,4}/
  }
  validates :company, length: { minimum: 10 }

end
