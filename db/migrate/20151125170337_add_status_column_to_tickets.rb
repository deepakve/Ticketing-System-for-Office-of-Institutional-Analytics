class AddStatusColumnToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :status, :string
  end
end
