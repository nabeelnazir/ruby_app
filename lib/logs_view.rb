# This class will return most and unique views.
class LogsView
  def initialize(logs)
    @logs = logs
  end

  def most_views
    @logs.map { |key, value| [key, value.size] }.to_h.sort_by { |_key, value| value }.reverse.to_h
  end

  def unique_views
    @logs.map { |key, value| [key, value.uniq.size] }.to_h.sort_by { |_key, value| value }.reverse.to_h
  end
end
