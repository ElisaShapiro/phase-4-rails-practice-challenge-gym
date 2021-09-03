class MembershipsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    #POST to /memberships even though no index/show ok
    def create
        membership = Membership.create!(membership_params)
        render json: membership, status: :created
    end

    private

    def membership_params
        params.permit(:charge, :client_id, :gym_id)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end
