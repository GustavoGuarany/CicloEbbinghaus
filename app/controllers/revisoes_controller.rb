class RevisoesController < ApplicationController
  
	def index
    @conteudos = Conteudo.all 
		@revisoes_feitas = Revisao.all
    @revisoes = @conteudos.map do |conteudo|
      [conteudo, calcular_revisoes(conteudo.primeiro_estudo)]
    end.to_h  
    @revisoes_hoje = revisoes_para_dia(Date.today)
    @revisoes_amanha = revisoes_para_dia(Date.today + 1.day)
    @revisoes_depois_amanha = revisoes_para_dia(Date.today + 2.day)                                                                                     
  end
	
	def update
    conteudo_id = params[:id]
    data_revisao = Date.today
    revisao = Revisao.find_or_initialize_by(conteudo_id: conteudo_id, data_revisao: data_revisao)

    revisao.concluido = true 

    if revisao.save
      render json: { status: 'success' }
    else
      render json: { status: 'error', message: revisao.errors.full_messages.join(", ") }, status: :unprocessable_entity
    end
  end

  private

  def revisao_params
    params.require(:revisao).permit(:concluido)
  end

	
  private

  def calcular_revisoes(data_primeiro_estudo)
      {
        revisao_1: data_primeiro_estudo + 1.day, 
        revisao_2: data_primeiro_estudo + 3.day, 
        revisao_3: data_primeiro_estudo + 7.day,
        revisao_4: data_primeiro_estudo + 15.day,  
        revisao_5: data_primeiro_estudo + 30.day,
        revisao_6: data_primeiro_estudo + 60.day 
      }

  end

  def revisoes_para_dia(data)
    revisoes_para_dia = {}
    @revisoes.each do |conteudo, datas|
      datas.each do |revisao, data_revisao| 
        if data_revisao == data
          revisoes_para_dia[conteudo] ||= []
          revisoes_para_dia[conteudo] << revisao
        end  
      end
    end
    revisoes_para_dia
  end
end
