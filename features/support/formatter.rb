
module Example
  class Formatter

    def initialize(step_mother, io, options)
      # This method must exist
      @io = io
    end

    def step_name(keyword, step_match, status, source_indent, background, file_colon_line)
      if status == :failed
        step_name = step_match.format_args(lambda{|param| "*#{param}*"})
        message = "#{keyword}#{step_name}"
        @io.puts Color.red(message)
        MyApp.failed_steps << message
      else
        step_name = step_match.format_args(lambda{|param| "*#{param}*"})
        message = "#{keyword}#{step_name}"
        @io.puts Color.green(message)
      end
    end

    module Color
      # @!visibility private
      def self.colorize(string, color)
        "\033[#{color}m#{string}\033[0m"
      end

      # @!visibility private
      def self.red(string)
        colorize(string, 31)
      end

      # @!visibility private
      def self.blue(string)
        colorize(string, 34)
      end

      # @!visibility private
      def self.magenta(string)
        colorize(string, 35)
      end

      # @!visibility private
      def self.cyan(string)
        colorize(string, 36)
      end

      # @!visibility private
      def self.green(string)
        colorize(string, 32)
      end
    end
  end
end

