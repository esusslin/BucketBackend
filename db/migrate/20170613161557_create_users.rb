class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :email
    	t.float :checking_acct
    	t.float :savings_acct
    	t.float :monthly

      t.timestamps
    end
  end
end
