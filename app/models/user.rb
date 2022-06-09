class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :clearbit_enriching

  private

  def clearbit_enriching
    UpdateUserJob.perform_later(self)
  end
end
