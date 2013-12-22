class PagesController < ApplicationController
  def home
    @runners = Runner.all
    @benchmarks = Result.distinct.pluck(:benchmark)
  end
end