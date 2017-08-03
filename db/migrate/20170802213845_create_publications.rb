class CreatePublications < ActiveRecord::Migration[5.1]
  def change
    create_table :publications do |t|
      t.string :name
      t.text :description
      t.string :place
      t.integer :permission_pub, default: 0

      t.timestamps
    end
  end
end
