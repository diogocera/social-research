class CreateResearchUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :research_units do |t|
      t.string :name
      t.date :year_of_foundation
      t.references :scientific_area
      t.references :country
      t.references :city
      t.references :funding

      t.timestamps
    end
  end
end
