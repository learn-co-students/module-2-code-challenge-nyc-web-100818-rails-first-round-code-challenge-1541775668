class CreateHeroines < ActiveRecord::Migration[5.0]
  def change
    create_table :heroines do |t|
      t.string :name
      t.string :super_name
      #puts a foreign key associating powers to heroines
      t.integer :power_id

      t.timestamps
    end
  end
end
