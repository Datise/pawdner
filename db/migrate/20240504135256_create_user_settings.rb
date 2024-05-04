class CreateUserSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :user_settings do |t|
      t.integer :length, default: 0
      t.integer :sentimentality, default: 0
      t.string :style
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
