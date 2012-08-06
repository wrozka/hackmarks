class ApplicationController < ActionController::Base
  extend Dependor::Injectable
  protect_from_forgery
  
  def injector
    @injector ||= Injector.new
  end
end
