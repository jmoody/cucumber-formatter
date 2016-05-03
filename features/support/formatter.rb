
module Example
  class Formatter

    # This method must exist.
    def initialize(step_mother, io, options)
      @io = io
    end

    def step_name(keyword, step_match, status, source_indent, background, file_colon_line)
      if status == :failed
        step_name = step_match.format_args(lambda{|param| "*#{param}*"})
        message = "#{keyword}#{step_name}"
        @io.puts MyApp::Color.red(message)
        MyApp.failed_steps << message
      else
        step_name = step_match.format_args(lambda{|param| "*#{param}*"})
        message = "#{keyword}#{step_name}"
        @io.puts MyApp::Color.green(message)
        MyApp.passed_steps << message
      end
    end
  end
end

