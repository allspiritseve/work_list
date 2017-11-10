module WorkList
  class Results
    attr_reader :items, :successes, :failures

    def initialize
      @items = []
      @successes = 0
      @failures = 0
    end

    def success(result)
      @successes += 1
      @items << {
        result: result,
        exception: nil,
        success: true
      }
    end

    def failure(exception)
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

    def exceptions
      @items.reject { |item| item[:success] }.map { |item| item[:exception] }
    end

    def outcomes
      @items.map { |item| item[:success] }
    end

    def success?
      @successes > 0
    end

    def failure?
      !success? && !noop?
    end

    def noop?
      @items.empty?
    end
  end
end
