class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string    :title,   null: false
      t.string    :description

      t.belongs_to    :user, null: false

      t.timestamps  null: false
    end
  end
end
