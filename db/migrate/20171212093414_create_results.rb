class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.string :param
      t.string :res

      t.timestamps
    end
  end
end
