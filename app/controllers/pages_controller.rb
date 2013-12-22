class PagesController < ApplicationController
  def home
    @runners = Runner.all.decorate
    @benchmarks = Result.distinct.pluck(:benchmark)
  end
end