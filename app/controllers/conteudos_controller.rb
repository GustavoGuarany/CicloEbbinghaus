class ConteudosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_content, only: [:edit, :update, :destroy]

  def index
    @conteudos = Conteudo.order(:id)
  end

  def show
  end

  def new
    @conteudo = Conteudo.new
  end

  def edit
  end

  def create
    @conteudo = Conteudo.new(content_params)
    if @conteudo.save
      redirect_to conteudos_path, notice: 'Conteúdo Criado com Sucesso.'
    else
      render :new
    end
  end

  def update
    if @conteudo.update(content_params)
      redirect_to conteudos_path, notice: 'Conteúdo Atualizado com Sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @conteudo.destroy
    redirect_to conteudos_path, notice: 'Conteúdo Deletado com Sucesso.'
  end

  private
    def set_content
      @conteudo = Conteudo.find(params[:id])
    end

    def content_params
      params.require(:conteudo).permit(:titulo, :descricao, :link, :palavra_chave, :primeiro_estudo, :resposta )
    end
end
