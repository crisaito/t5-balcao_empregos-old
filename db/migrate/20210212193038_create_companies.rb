class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :cnpj
      t.string :site
      t.string :linkedin

      t.timestamps
    end
  end
end
