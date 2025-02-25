class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, except: [:created_at, :updated_at]
  end

  def show
    bird = Bird.find_by_id(params[:id])
    if bird
      render json: bird, only: [:id, :name, :species]
    else
      render json:{message: 'Bird not found'}
    end
  end
end

# except: or only: can specify hash elements