class CreateSequences < ActiveRecord::Migration
  def self.up
    create_table :sequences do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :sequences
  end
end
