class ChangePermissionFromPublications < ActiveRecord::Migration[5.1]
  def change
    rename_column :publications, :permission, :permission_pub
  end
end
