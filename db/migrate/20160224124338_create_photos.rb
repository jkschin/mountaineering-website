class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :caption
      t.attachment :attachment
      t.timestamps
    end
  end
end
