class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :title
      t.text :desc
      t.text :loc

      t.timestamps
    end
  end
end
