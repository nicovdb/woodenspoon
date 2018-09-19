class AddTeamuserPseudoToTeamusers < ActiveRecord::Migration[5.2]
  def change
    add_column :teamusers, :teamuser_pseudo, :string
  end
end
