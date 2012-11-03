module PrettyFace
  module Formatter
    module ViewHelper

      def start_time
        @tests_started.strftime("%a %B %-d, %Y at %H:%M:%S")
      end

      def step_count
        @step_times.size
      end

      def scenario_count
        @scenario_times.size
      end

      def total_duration
        @duration
      end

      def step_average_duration
        format_duration get_average_from_float_array @step_times
      end

      def scenario_average_duration
        format_duration get_average_from_float_array @scenario_times
      end

      def passing_scenarios
        summary_percent(@passing_scenarios, scenario_count)
      end

      def failing_scenarios
        summary_percent(@failing_scenarios, scenario_count)
      end

      def passing_steps
        summary_percent(@passing_steps, step_count)
      end

      def failing_steps
        summary_percent(@failing_steps, step_count)
      end

      def skipped_steps
        summary_percent(@skipped_steps, step_count)
      end

      private

      def get_average_from_float_array (arr)
        arr.reduce(:+).to_f / arr.size
      end

      def summary_percent(number, total)
        "#{number} (#{(number.to_f / total) * 100}%)"
      end
    end
  end
end