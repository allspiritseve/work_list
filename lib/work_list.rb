require 'work_list/version'
require 'work_list/results'

module WorkList
  def self.perform(items, &block)
    results = Results.new

    items.each do |item|
      begin
        results.success(block.call(item))
      rescue => exception
        results.failure(exception)
      end
    end

    if results.failure?
      # Raise the first exception, as if we weren't rescuing them.
      raise results.exceptions.first
    else
      results
    end
  end
end
