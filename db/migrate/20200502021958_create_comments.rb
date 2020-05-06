class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :comment
      t.belongs_to :user
      t.belongs_to :tv_show

      t.timestamps
    end
  end
end
