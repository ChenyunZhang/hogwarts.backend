class PigsController < ApplicationController
    

    def index 
        pigs = Pig.all
        render json: pigs
    end

end
