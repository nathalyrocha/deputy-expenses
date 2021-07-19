class UploadsController < ApplicationController
  def new
    @upload = Upload.new
  end

  def create
    return redirect_to new_upload_path unless params[:upload][:document].present?
    
    @upload = Upload.create(upload_params)

    ImportExpensesJob.perform_later(@upload.id)

    redirect_to deputies_path, notice: 'Aguarde enquanto carregamos os dados.'
  end

  private

  def upload_params
    params.require(:upload).permit(:document)
  end
end
