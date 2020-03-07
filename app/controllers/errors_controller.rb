class ErrorsController < ApplicationController
  def test
    raise Exception.new('something bad happened!')
  end
end
