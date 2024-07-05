class CreateRevisoes < ActiveRecord::Migration[7.0]
  def change
    create_table :revisoes do |t|
      t.references :conteudo, null: false, foreign_key: true
      t.date :data_revisao
      t.boolean :concluido
      t.integer :revisoes_count, default: 0

      t.timestamps
    end
  end
end
