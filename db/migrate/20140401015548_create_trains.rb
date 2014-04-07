class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.string :train_line
      t.string :route_name
      t.string :run_number
      t.string :operator_id

      t.timestamps
    end
  end
end
