class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :department
      t.string :phone_number
      t.date :date_needed_by
      t.string :email
      t.string :priority
      t.string :position
      t.string :type_of_request
      t.string :purpose
      t.text :description
      t.string :time_period
      t.string :student_type
      t.string :campus
      t.integer :irb, :limit => 8
      t.string :grant_pi
      t.timestamps null: false
    end
  end
end
