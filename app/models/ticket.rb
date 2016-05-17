class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Ticket < ActiveRecord::Base
  belongs_to :user
  
  validates :first_name, :last_name, :job_title, :department,
            :date_needed_by, :email, :priority, :position, :type_of_request, :purpose,
            :description, :time_period, :student_type, :campus,
            presence: true
  
  validates :email, presence: true, email: true
  validates :phone_number, presence: true,format: { with: /\d{3}-\d{3}-\d{4}/, message: "Bad Format"}
  
  validates_each :date_needed_by do |record, attr, value|
    record.errors.add(attr, 'must be not in the past') if value <= Time.now.to_date
  end
  
end
