class AddRespostaToConteudos < ActiveRecord::Migration[7.0]
  def change
    add_column :conteudos, :resposta, :text
  end
end
