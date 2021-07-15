class UploadsController < ApplicationController
  def create
    return redirect_to new_uploads_path unless params[:file].present?

    ::Extractor.new(params[:file]).read

    redirect_to deputies_path
  end
end
