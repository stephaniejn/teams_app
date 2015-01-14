class CreateTagsTeams < ActiveRecord::Migration
  def change
    create_table :tags_teams do |t|
      t.references :tag, index: true
      t.references :team, index: true

      t.timestamps
    end
  end
end
