class CreateShoesTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoes) do |t|
      t.column(:brand, :string)
      t.column(:price, :integer)

      t.timestamps()
    end
  end
end
