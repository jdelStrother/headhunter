module Headhunter
  class HtmlRunner
    def initialize(app)
      @html_validator = HtmlValidator.new
    end

    def process(url, html)
      @html_validator.validate(url, html)
    end

    def results
      @html_validator.statistics
    end

  end
end
