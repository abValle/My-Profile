require 'csv'
require_relative 'controller'
require_relative 'repository'

repo = Repository.new(File.join(__dir__, 'posts.csv'))
controller = Controller.new(repo)
controller.create
