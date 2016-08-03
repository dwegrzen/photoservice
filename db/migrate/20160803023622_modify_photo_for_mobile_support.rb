class ModifyPhotoForMobileSupport < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :smsstatus, :string
    add_column :photos, :mobileurl, :string

  end
end
