class Movie < ActiveRecord::Base
  attr_accessor :title, :genre, :release_year

  validates :title, :presence => true, uniqueness: { case_sensitive: false } # validating that title is present
  validates :genre, :presence => true
  validates :release_year, :presence => true, numericality: { only_integer: true }
  
  belongs_to :user

end
