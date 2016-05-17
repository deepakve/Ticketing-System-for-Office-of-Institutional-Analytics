class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end
class User < ActiveRecord::Base
  has_many :tickets

  validates :first_name, :last_name, presence: true
  validates :name, presence: true, uniqueness: true
  has_secure_password
  
  after_destroy :ensure_an_admin_remains
  
  validates :email, presence: true, email: true
  
  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end
  
    def name_with_role
    "#{first_name} - #{role}"
  end

end
