class AliveController < ActionController::API
    def index
      output = { 'Somofo' => 'Is alive!' }.to_json
      render json: output
    end
end