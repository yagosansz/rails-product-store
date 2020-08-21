class AddDepartmentIdToProduct < ActiveRecord::Migration[6.0]
  def change
  	add_column :products, :department_id, :number
  end
end
