class ApplicationController < ActionController::Base
  config.generators do |g|
    g.template_engine :slim
  end
end
