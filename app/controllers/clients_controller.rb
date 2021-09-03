class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    #GET /clients
    def index
        clients = Client.all
        render json: clients, except: [:created_at, :updated_at]
    end
    #GET /clients/:id
    def show
        client = Client.find(params[:id])
        render json: client, except: [:created_at, :updated_at]
    end
    #PATCH /clients/:id
    def update
        client = Client.find_by(id: params[:id])
        client.update(client_params)
        render json: client
    end
    private
    def client_params
        params.permit(:name, :age)
    end
    def render_not_found_response
        render json: { error: "Client not found"}, status: :not_found
    end
end
