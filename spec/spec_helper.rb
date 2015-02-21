Dir[File.expand_path('../../*.rb', __FILE__)].each { |file| require file }

RSpec.configure do |config|
  config.order = 'random'
  config.color = true
  config.expect_with(:rspec) { |c| c.syntax = :expect }
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end
