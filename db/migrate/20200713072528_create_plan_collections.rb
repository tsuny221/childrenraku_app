class CreatePlanCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :plan_collections do |t|

      t.timestamps
    end
  end
end
