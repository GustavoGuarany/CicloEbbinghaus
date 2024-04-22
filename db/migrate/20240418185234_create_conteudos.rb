class CreateConteudos < ActiveRecord::Migration[7.0]
  def change
    create_table :conteudos do |t|
      t.string :titulo
      t.text :descricao
      t.string :link
      t.string :palavra_chave
      t.date :primeiro_estudo

      t.timestamps
    end
  end
end
