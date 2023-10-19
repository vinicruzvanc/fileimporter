class PurchasersController < ApplicationController
  before_action :set_purchaser, only: %i[show edit update destroy]

def import
  file = params[:file]

  # redirecionar se algum dado estiver errado

  return redirect_to root_path, alert: 'Nenhum arquivo foi selecionado!' unless file
  return redirect_to root_path, alert: 'Selecione um arquivo no formato ".txt" ou ".csv"!' unless file.content_type == 'text/csv' ||
   file.content_type == 'text/plain'
  return redirect_to root_path, alert: 'Dados não importados, verifique se os dados estão separados por "TAB" ou ";"!' unless File.read(file.path).include?(';') || File.read(file.path).include?("\t")
  # importar dados
  fileImportService = FileImportService.new(file)
  fileImportService.import

  # redirecionamento com dados importados corretamente
  redirect_to root_path,
  notice: 'Dados importados com sucesso!'
end

  # GET /purchasers or /purchasers.json
  def index
    @purchasers = Purchaser.all
  end

  # GET /purchasers/1 or /purchasers/1.json
  def show
    @purchaser = Purchaser.find(params[:id])
  end

  # GET /purchasers/new
  def new
    @purchaser = Purchaser.new
  end

  # GET /purchasers/1/edit
  def edit
  end

  # POST /purchasers or /purchasers.json
  def create
    @purchaser = Purchaser.new(purchaser_params)

    @purchaser.total_income = @purchaser.purchase_count * @purchaser.item_price

    respond_to do |format|
      if @purchaser.save
        format.html { redirect_to purchaser_url(@purchaser), notice: "Cadastro efetuado com sucesso!" }
        format.json { render :show, status: :created, location: @purchaser }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchaser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchasers/1 or /purchasers/1.json
  def update
    respond_to do |format|
      if @purchaser.update(purchaser_params)
        @purchaser.total_income = @purchaser.item_price * @purchaser.purchase_count
        @purchaser.save
        format.html { redirect_to purchaser_url(@purchaser), notice: "Edição de cadastro efetuada com sucesso!" }
        format.json { render :show, status: :ok, location: @purchaser }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchaser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchasers/1 or /purchasers/1.json
  def destroy
    @purchaser.destroy

    respond_to do |format|
      format.html { redirect_to purchasers_url, notice: "Cadastro foi deletado com sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchaser
      @purchaser = Purchaser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchaser_params
      params.require(:purchaser).permit(:purchaser_name, :item_description, :item_price, :purchase_count, :merchant_address, :merchant_name)
    end
end
