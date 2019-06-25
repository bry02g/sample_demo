class AddFileName < ActiveRecord::Migration[6.0]
  def change
      add_column :file_uploaders, :file_name, :string
  end
end
