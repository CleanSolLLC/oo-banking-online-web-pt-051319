require 'pry'
class Transfer
  attr_accessor :transfer, :bankaccount, :sender,
                :receiver, :amount, :status
  attr_reader

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    true if sender.valid? == receiver.valid?
  end

  def execute_transaction
    binding.pry
  end

end
