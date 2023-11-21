class PurchasersController < ApplicationController
  before_action :set_purchaser, only: %i[show edit update destroy]
  before_action :not_found, only: %i[show edit update destroy]
  skip_before_action :role, only: %i[ index show new create edit update destroy]

def not_found
  if @purchaser.authentication_id != current_user.id
    raise ActiveRecord::RecordNotFound
  end
end

def import

  file = params[:file]

  return redirect_to root_path, alert: 'Nenhum arquivo foi selecionado!' unless file
  return redirect_to root_path, alert: 'Selecione um arquivo no formato ".txt" ou ".csv"!' unless file.content_type == 'text/csv' ||
   file.content_type == 'text/plain'
  return redirect_to root_path, alert: 'Dados não importados, verifique se os dados estão separados por "TAB" ou ";"!' unless File.read(file.path).include?(';') || File.read(file.path).include?("\t")

  fileImportService = FileImportService.new(file)
  fileImportService.import

  redirect_to root_path,
  notice: 'Dados importados com sucesso!'
end

  def index
    @purchasers = Purchaser.where(authentication: current_user).order(:purchaser_name).page(params[:page])
  end

  def show
    @purchaser = Purchaser.find(params[:id])
  end

  def new
    @purchaser = Purchaser.new
  end

  def edit
  end

  def create
    @purchaser = Purchaser.new(purchaser_params)

    respond_to do |format|
      if @purchaser.save       
        @purchaser.total_income = @purchaser.purchase_count * @purchaser.item_price
        format.html { redirect_to purchaser_url(@purchaser), notice: "Cadastro efetuado com sucesso!" }
        format.json { render :show, status: :created, location: @purchaser }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchaser.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|

      if @purchaser.update(purchaser_params)

        @purchaser.total_income = @purchaser.item_price * @purchaser.purchase_count
        format.html { redirect_to purchaser_url(@purchaser), notice: "Edição de cadastro efetuada com sucesso!" }
        format.json { render :show, status: :ok, location: @purchaser }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchaser.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @purchaser.destroy

    respond_to do |format|
      format.html { redirect_to purchasers_url, status: :see_other, notice: "Cadastro deletado com sucesso!" }
      format.json { head :no_content }
    end
  end

  private

    def set_purchaser
      @purchaser = Purchaser.find(params[:id])
    end

    def purchaser_params
      params.require(:purchaser).permit(:purchaser_name, :item_description, :item_price, :purchase_count, :item_price,:merchant_address, :merchant_name)
    end
end
