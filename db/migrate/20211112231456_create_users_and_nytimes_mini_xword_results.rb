class CreateUsersAndNytimesMiniXwordResults < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name

      t.timestamps
    end

    create_table :nytimes_mini_xword_results do |t|
      t.belongs_to :user
      t.datetime :published_at
      t.integer :seconds

      t.timestamps

      t.index ["user_id", "published_at"], name: "idx_nytmx_results_on_user_id_published_at", :unique => true
    end
  end
end
