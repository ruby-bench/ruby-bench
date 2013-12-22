class RunnerDecorator < Draper::Decorator
  delegate_all

  def description
    "#{object.name} (#{object.hardware})"
  end
end
