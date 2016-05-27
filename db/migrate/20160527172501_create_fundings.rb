class CreateFundings < ActiveRecord::Migration[5.0]
  def change
    create_table :fundings do |t|
      t.string :name

      t.timestamps
    end
  end
end
