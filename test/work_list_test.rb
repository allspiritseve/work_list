require "test_helper"
require 'work_list'

class WorkListTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::WorkList::VERSION
  end

  def test_failure_rate
    results = WorkList::Results.new
    assert_equal 0, results.success_rate
    results.record_success(1)
    assert_equal 1, results.success_rate
    results.record_failure(Exception.new('error'))
    assert_equal 0.5, results.success_rate
    results.record_failure(Exception.new('error'))
    assert_equal 1 / 3.0, results.success_rate
  end

  def test_failure_rate
    results = WorkList::Results.new
    assert_equal 0, results.failure_rate
    results.record_success(1)
    assert_equal 0, results.failure_rate
    results.record_failure(Exception.new('error'))
    assert_equal 0.5, results.failure_rate
    results.record_failure(Exception.new('error'))
    assert_equal 2 / 3.0, results.failure_rate
  end
end
