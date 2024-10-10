# frozen_string_literal: true

require_relative "replica/version"
require_relative "replica/routing"

module Replica
  class Application
    def call(env)
      
      if env['PATH_INFO'] == '/'
        return [200, {'content-type' => 'text/html'}, ['All good!']]
      elsif env['PATH_INFO'] == '/favicon.ico'
        return [404, 
          {'content-type' => 'text/html'}, []]
      end
      
      
      begin
        klass, act = get_controller_and_action(env)
        controller = klass.new(env)
        text = controller.send(act)
        [200, {'content-type' => 'text/html'}, [text]]
      rescue NameError
        [500, {'content-type' => 'text/html'}, ['no route found']]
      end
    end
  end
  
  class Controller
    def initialize(env)
      @env = env
    end
    
    def env
      @env
    end
  end
end
