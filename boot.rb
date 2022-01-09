require 'bundler'
require 'yaml'
PROJECT_ROOT = Bundler.root
APP_ROOT = PROJECT_ROOT.join('app')
CONFIG_ROOT = Bundler.root.join('config')
APPLICATION_CONFIGS = YAML.load_file(CONFIG_ROOT.join('application.yml')).transform_keys(&:to_sym)

Dir.glob(APP_ROOT.join('*/*.rb')).sort.each { |rb| require rb }
