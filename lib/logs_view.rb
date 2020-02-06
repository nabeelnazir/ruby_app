class LogsView
  def initialize(logs)
    @logs = logs
  end

  def most_views
    @logs.map { |k, v| [k, v.size] }.to_h.sort_by { |_k, v| v }.reverse.to_h
  end

  def unique_views
    @logs.map { |k, v| [k, v.uniq.size] }.to_h.sort_by { |_k, v| v }.reverse.to_h
  end
end
