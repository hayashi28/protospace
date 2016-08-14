class CreatePrototypeImages < ActiveRecord::Migration
  def change
    create_table :prototype_images do |t|
      t.string     :image
      t.integer    :prototype_id
      t.integer    :role, default: 0, null: false, limit: 1
      t.timestamps null: false
    end
  end
end
