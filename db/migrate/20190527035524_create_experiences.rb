class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :company
      t.string :first_day
      t.string :last_day
      t.text :description

      t.timestamps
    end
  end
end
