class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_respons
end
