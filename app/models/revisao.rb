class Revisao < ApplicationRecord 
	belongs_to :conteudo, counter_cache: :revisoes_count
end 