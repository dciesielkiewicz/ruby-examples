class ApplicationController < ActionController::API
  def show_errors(errors)
    {
        status: 'error',
        errors: errors.as_json
    }
  end
end
