json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :first_name, :last_name, :job_title, :department, :phone_number, :date_needed_by, :email, :priority, :position, :type_of_request, :purrpose, :description, :time_period, :student_type, :campus, :irb, :grant_pi
  json.url ticket_url(ticket, format: :json)
end
