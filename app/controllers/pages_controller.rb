class PagesController < ApplicationController
  def home
    @purchasers = Purchaser.all
  end
end
