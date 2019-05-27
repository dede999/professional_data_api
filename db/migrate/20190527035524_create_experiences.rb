class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :nane
      t.string :start
      t.string :final
      t.text :description

      t.timestamps
    end
  end
end
