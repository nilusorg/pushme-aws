class AddDevicesTo<%= table_name.to_s.camelize %> < ActiveRecord::Migration<%= migration_version %>
  def change
    add_column :<%= table_name %>, :devices, :json, default: {}
  end
end
