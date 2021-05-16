class CreateHomeworks < ActiveRecord::Migration[6.1]
  def change
    create_table :homeworks do |t|
      t.integer :student_id
      t.integer :teacher_id
      t.string :title

      t.timestamps
    end
  end
end
