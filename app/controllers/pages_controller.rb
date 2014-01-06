class PagesController < ApplicationController
  def home
    @runners = Runner.all.decorate
  end
end
