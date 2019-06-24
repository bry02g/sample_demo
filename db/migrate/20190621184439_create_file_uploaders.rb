class CreateFileUploaders < ActiveRecord::Migration[6.0]
  def change
    create_table :file_uploaders do |t|

      t.timestamps
    end
  end
end
