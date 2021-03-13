class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :type
      t.boolean :value
      t.timestamps
    end
  end
end
