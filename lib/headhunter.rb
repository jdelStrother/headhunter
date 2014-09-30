require 'headhunter/engine'
require 'headhunter/css_hunter'
require 'headhunter/css_validator'
require 'headhunter/html_validator'
require 'headhunter/rails'
require 'headhunter/runners/runner'
require 'headhunter/runners/html_runner'
require 'headhunter/runners/css_runner'
if ENV['HEADHUNTER']
  require 'headhunter/auto_report'
end

module Headhunter
  mattr_accessor :runner
  delegate :html_runner, :css_runner, :to=>:runner
end
