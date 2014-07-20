class AddWriterToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :writer, :string
  end
end
