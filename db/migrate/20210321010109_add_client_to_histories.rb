class AddClientToHistories < ActiveRecord::Migration[5.2]
  def change
    add_reference :histories, :client, foreign_key: true
  end
end
