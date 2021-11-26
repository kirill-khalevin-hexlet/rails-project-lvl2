class ApplicationController < ActionController::Base
  config.generators do |g|
    g.template_engine :slim
  end

  def redirect_root
    redirect_to root_path
  end
end
