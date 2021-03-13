class CreateCustumers < ActiveRecord::Migration[5.2]
  def change
    create_table :custumers do |t|
      t.string :external_code
      t.string :name
      t.string :email
      t.string :contact
      t.timestamps
    end
  end
end
