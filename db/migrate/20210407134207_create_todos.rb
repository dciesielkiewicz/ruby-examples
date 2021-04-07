class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos, id: :uuid do |t|
      t.string :title, null: false
      t.boolean :checked, null: false

      t.timestamps
    end
  end
end
