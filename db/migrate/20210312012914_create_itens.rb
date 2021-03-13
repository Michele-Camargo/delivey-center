class CreateItens < ActiveRecord::Migration[5.2]
  def change
    create_table :itens do |t|
      t.string :external_code
      t.string :name
      t.boolean :price
      t.integer :quantity
      t.boolean :total
      t.timestamps
      #adicionar "sub_itens":[]
    end
  end
end
