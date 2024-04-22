class ConteudosController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  def index
    @conteudos = Conteudo.all
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
      redirect_to @conteudo, notice: 'Content was successfully created.'
    else
      render :new
    end
  end

  def update
    if @conteudo.update(content_params)
      redirect_to @conteudo, notice: 'Content was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @conteudo.destroy
    redirect_to contents_url, notice: 'Content was successfully destroyed.'
  end

  private
    def set_content
      @conteudo = Conteudo.find(params[:id])
    end

    def content_params
      params.require(:conteudo).permit(:titulo, :descricao, :link, :palavra_chave, :primeiro_estudo )
    end
end
