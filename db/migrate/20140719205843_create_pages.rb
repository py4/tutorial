class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :content
      t.references :subject, index: true

      t.timestamps
    end
  end
end
