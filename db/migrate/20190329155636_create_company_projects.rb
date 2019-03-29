class CreateCompanyProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :company_projects do |t|
      t.string :project, limit: 30
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
