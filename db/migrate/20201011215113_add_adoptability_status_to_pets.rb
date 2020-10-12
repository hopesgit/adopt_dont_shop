class AddAdoptabilityStatusToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :adoptability, :string
  end
end
