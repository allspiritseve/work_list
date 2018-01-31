require 'work_list/version'
require 'work_list/results'

module WorkList
  def self.perform(items, &block)
    results = Results.new

    items.each do |item|
      begin
        results.record_success(block.call(item))
      rescue => exception
        results.record_failure(exception)
      end
    end

    results
  end
end
