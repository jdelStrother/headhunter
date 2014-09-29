module Headhunter
  class CssRunner
    ASSETS_PATH = 'public/assets'
    def initialize(app)
      @app = ActionDispatch::Integration::Session.new(app)
      @css_hunter     = CssHunter.new
      @css_validator = CssValidator.new
      @fetched_stylesheets = Set.new
    end

    def process(url, html)
      document = Nokogiri::HTML(html)
      stylesheets = document.css("link[rel=stylesheet]").map{|n| n['href']}
      stylesheets.each{|stylesheet|
        if !@fetched_stylesheets.include?(stylesheet)
          @app.get(stylesheet)
          @css_hunter.add_stylesheet(@app.response.body)
          @fetched_stylesheets << stylesheet
        end
      }
      @css_hunter.process(document)
      # TODO: maybe we should call @css_validator.validate(html) ?
    end

    def results
      [
        @css_hunter.statistics,
        @css_validator.statistics,
      ]
    end

  end
end
