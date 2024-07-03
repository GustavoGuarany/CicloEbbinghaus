class RevisoesController < ApplicationController

  def index
    @conteudos = Conteudo.all 
    @revisoes = @conteudos.map do |conteudo|
      [conteudo, calcular_revisoes(conteudo.primeiro_estudo)]
    end.to_h  
    @revisoes_hoje = revisoes_para_dia(Date.today)
    @revisoes_amanha = revisoes_para_dia(Date.today + 1.day)
    @revisoes_depois_amanha = revisoes_para_dia(Date.today + 2.day)                                                                                     
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
