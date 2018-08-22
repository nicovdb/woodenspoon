class AddCodeToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :code, :string
  end
end
