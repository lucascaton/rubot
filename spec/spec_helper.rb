require 'pry'

['..', 'macros'].each do |dir|
  Dir[File.expand_path("../#{dir}/*.rb", __FILE__)].each { |file| require file }
end

RSpec.configure do |config|
  config.order = 'random'
  config.color = true
  config.expect_with(:rspec) { |c| c.syntax = :expect }
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.include(TalkHelper)
end
