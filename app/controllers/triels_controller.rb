class TrielsController < ApplicationController

    def new
        @triel = Triel.new
    end

    def create
        @triel = Triel.new(triel_params)
        if @triel.save
            redirect_to triel_path(@triel) , notice: "saved"
        else
           redirect_to new_triel_path , notice: "not saved"
        end
     end

    def show
     
         @triel = Triel.find(params[:id])

    end

    def triel_params
        params.require(:triel).permit(:name)
    end

end
