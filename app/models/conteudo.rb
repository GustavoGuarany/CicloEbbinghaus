class Conteudo < ApplicationRecord
	has_many :revisoes, class_name: 'Revisao', foreign_key: 'conteudo_id', dependent: :destroy
end
