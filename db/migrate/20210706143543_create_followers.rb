class CreateFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :followers do |t|
      t.references :follower, reference: :user
      t.references :followed_user, reference: :user
      t.timestamps
    end
  end
end
