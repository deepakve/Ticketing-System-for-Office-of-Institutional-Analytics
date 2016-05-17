all below in Gemfile

gem 'mysql'
gem 'devise'
gem 'simple_form'

then bundle install

install mysql database:

sudo apt-get install mysql-server mysql-client libmysqlclient-dev
username: root
password: root

Login : mysql -u root -p

Create Login:

rails generate devise:install     
rails generate devise admin        
rails generate devise:views admin 

Create Model, View, Controller for the following:

rails g scaffold user first_namme:string last_name:string phone_number:integer email_id:string unit:string role:string
rails g scaffold ticket first_namme:string last_name:string job_title:string phone_number:integer department:string needed_by:date email_id:string priority:string are_you:string type_of_request:string purpose_of_request:text description_of_request:text time_period:integer student_type:string campus:string irb:integer grant_pi:string user:references

Create Model for Drop Down Data:

rails g model priority name:string
rails g model request_type name:string
rails g model campus name:string
rails g model student name:string
rails g model you_are name:string
rails g model programmer name:string

Database:
rake db:create
rake db:migrate   
rake db:seed  