class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string    :postcode        ,null: false                    
      t.integer   :prefecture      ,null: false                    
      t.string    :city            ,null: false                    
      t.string    :address         ,null: false                    
      t.string    :building        ,null: false                               
      t.string    :phone_number    ,null: false                    
      t.integer   :management_id   ,null: false, foreign_key: true  
      t.timestamps
    end
  end
end
