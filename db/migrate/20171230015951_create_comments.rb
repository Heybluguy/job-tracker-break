class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.timestamps
      t.references :job, foreign_key: true
    end
  end
end
