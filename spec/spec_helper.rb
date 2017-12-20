$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sheets'

require 'shared_import_examples'

require 'figaro'

Figaro.application = Figaro::Application.new(environment: '', path: 'config/application.yml')
Figaro.load
