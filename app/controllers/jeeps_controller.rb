class JeepsController < ApplicationController
  before_action :set_jeep, only: %i[ show destroy ]

# GET /jeeps or /jeeps.json
def index
  @jeeps = Jeep.all
end

# GET /jeeps/1 or /jeeps/1.json
def show
end

# DELETE /jeeps/1 or /jeeps/1.json
def destroy
  @jeep.destroy
  respond_to do |format|
    format.html { redirect_to jeeps_url, notice: "jeep was successfully destroyed." }
    format.json { head :no_content }
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_jeep
    @jeep = Jeep.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def jeep_params
    params.require(:jeep).permit(:abbreviation, :city, :conference, :division, :full_name, :name)
  end
end
