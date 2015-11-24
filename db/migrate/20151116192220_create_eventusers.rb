class CreateEventusers < ActiveRecord::Migration
  def change
    create_table :eventusers do |t|
    	t.boolean :join
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
