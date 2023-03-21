class CreateUserinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :userinfos do |t|
      t.string     :postal_code,             null: false
      t.integer    :prefecture_id,           null: false
      t.string     :job,                     null: false 
      t.string     :hoby,                    null: false 
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
