class AddLowerIndexesToCustomers < ActiveRecord::Migration
  def up
    execute %{
      CREATE INDEX
        custumers_lower_last_name
      ON
        custumers (lower(last_name) varchar_pattern_ops)
    }
    execute %{
      CREATE INDEX
        custumers_lower_first_name
      ON
        custumers (lower(first_name) varchar_pattern_ops)
    }
    execute %{
      CREATE INDEX
        custumers_lower_email
      ON
        custumers (lower(email))
    }
  end
  def down
    remove_index :custumers, name: 'custumers_lower_last_name'
    remove_index :custumers, name: 'custumers_lower_first_name'
    remove_index :custumers, name: 'custumers_lower_email'
  end
end
