class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    #GET /gyms
    def index
        gyms = Gym.all
        render json: gyms, except: [:created_at, :updated_at]
    end
    #GET /gyms/:id
    def show
        gym = Gym.find(params[:id])
        render json: gym, except: [:created_at, :updated_at]
    end
    #DELETE /gyms/:id
    def destroy
        gym = Gym.find_by(id: params[:id])
        gym.destroy
        head :no_content
    end
    #PATCH /gyms/:id
    def update
        gym = Gym.find_by(id: params[:id])
        gym.update(gym_params)
        render json: gym
    end

    private
    def gym_params
        params.permit(:name, :address)
    end

    def render_not_found_response
        render json: { error: "Gym not found"}, status: :not_found
    end
end
