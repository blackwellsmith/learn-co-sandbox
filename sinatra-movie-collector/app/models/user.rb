class User < ActiveRecord::Base
  attr_accessor :first_name, :last_name, :zip_code
  has_secure_password

  validates :email, :presence => true, uniqueness: { case_sensitive: false } # validating that email is present
  validates :password, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :zip_code, :presence => true, numericality: { only_integer: true }
  # validates :first_name, presence: { message: "must be given please" }
  # validates :last_name, presence: { message: "must be given please" }

  has_many :movies

  #possible add "acceptance: true" validation for terms of service?
  #format validation 2.5 validates :legacy_code, format: { with: /\A[a-zA-Z]+\z/,
  #  message: "only allows letters" }
  #length 2.7
end
