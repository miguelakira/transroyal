class CompradoresController < ApplicationController
  before_filter :authenticate_user!

  def index
    @compradores = Comprador.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @compradores }
    end
  end

  def show
    @comprador = Comprador.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comprador }
    end
  end

  def new
    @comprador = Comprador.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comprador }
    end
  end

  def edit
    @comprador = Comprador.find(params[:id])
  end

  def create
    @comprador = Comprador.new(params[:comprador])

    respond_to do |format|
      if @comprador.save
        format.html { redirect_to @comprador, notice: 'Comprador was successfully created.' }
        format.json { render json: @comprador, status: :created, location: @comprador }
      else
        format.html { render action: "new" }
        format.json { render json: @comprador.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @comprador = Comprador.find(params[:id])

    respond_to do |format|
      if @comprador.update_attributes(params[:comprador])
        format.html { redirect_to @comprador, notice: 'Comprador was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comprador.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comprador = Comprador.find(params[:id])
    @comprador.destroy

    respond_to do |format|
      format.html { redirect_to compradores_url }
      format.json { head :no_content }
    end
  end
end
