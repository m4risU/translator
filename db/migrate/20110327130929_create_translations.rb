class CreateTranslations < ActiveRecord::Migration
  def self.up
    create_table :translations do |t|
      t.string :key
      t.string :value
      t.string :code
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :translations
  end
end
