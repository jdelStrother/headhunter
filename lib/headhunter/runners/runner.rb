require 'fileutils'

module Headhunter
  class Runner
    attr_accessor :results
    attr_accessor :html_runner
    attr_accessor :css_runner

    def initialize(app)
      @runners = []
      if (ENV['HEADHUNTER_HTML'] || 'true') == 'true'
        self.html_runner = HtmlRunner.new(app)
        @runners << self.html_runner
      end
      if (ENV['HEADHUNTER_CSS'] || 'true') == 'true'
        self.css_runner = CssRunner.new(app)
        @runners << self.css_runner
      end
    end

    def process(url, html)
      @runners.each do |runner|
        runner.process(url, html)
      end
    end

    def report
      puts @runners.map { |runner| runner.results }.compact.join "\n\n"
    end
  end
end
