class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.bigint :employee_id
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :avatar

      t.timestamps
    end
  end
end
