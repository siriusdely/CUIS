# frozen_string_literal: true

class Account < ApplicationRecord
  has_many :allotments, dependent: :destroy
  # attr_readonly :is_positive
  # attr_readonly :balance

  TYPES = %i[assets liabilities equity income expenses].freeze

  def is_positive=(_value)
    raise "Can't set read-only attribute."
  end

  def account_type=(account_type)
    account_type = account_type.to_sym
    self.type_mask =
      TYPES.include?(account_type) ? 2**TYPES.index(account_type) : 0
    self[:is_positive] = (1..3).cover?(TYPES.index(account_type)) ? 1 : 0
  end

  def account_type
    TYPES.find do |at|
      ((type_mask.to_i || 0) & 2**TYPES.index(at)).nonzero?
    end
  end
end
