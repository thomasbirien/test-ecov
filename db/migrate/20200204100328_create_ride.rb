class CreateRide < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :ref
      t.string :state
    end
  end
end
