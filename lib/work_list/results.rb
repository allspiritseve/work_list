module WorkList
  class Results
    attr_reader :items, :successes, :failures

    def initialize
      @items = []
      @successes = 0
      @failures = 0
    end

    def record_success(result)
      @successes += 1
      @items << {
        result: result,
        exception: nil,
        success: true
      }
    end

    def record_failure(exception)
      @failures += 1
      @items << {
        result: nil,
        exception: exception,
        success: false
      }
    end

    def results
      @items.select { |item| item[:success] }.map { |item| item[:result] }
    end

    def each_result(&block)
      results.each(&block)
      self
    end

    def exceptions
      @items.reject { |item| item[:success] }.map { |item| item[:exception] }
    end

    def each_exception(&block)
      exceptions.each(&block)
      self
    end

    def outcomes
      @items.map { |item| item[:success] }
    end

    def success?
      @successes > 0
    end

    def failure?
      @failures > 0
    end

    def noop?
      @items.empty?
    end

    def all_failures?
      failure_rate == 1.0
    end

    def failure_rate
      if noop?
        0
      else
        Rational(@failures, @items.count)
      end
    end

    def raise_if_failure
      raise_exception if failure?
    end

    def raise_if_all_failures
      raise_exception if all_failures?
    end

    def raise_if_failure_rate(threshold)
      raise_exception if failure_rate >= threshold
    end

    def raise_exception
      raise exceptions.first
    end
  end
end
