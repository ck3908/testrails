class PersonController < ApplicationController
  def index
    @person = Person.all
  end
end
