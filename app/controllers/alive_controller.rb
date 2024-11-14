class AliveController < ActionController::API
    def index
      output = { 'Sofomo' => 'Is alive!' }.to_json
      render json: output
    end
end