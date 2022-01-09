require 'bundler'
PROJECT_ROOT = Bundler.root
APP_ROOT = PROJECT_ROOT.join('app')
CONFIG_ROOT = Bundler.root.join('config')

Dir.glob(APP_ROOT.join('*/*.rb')).sort.each { |rb| require rb }
