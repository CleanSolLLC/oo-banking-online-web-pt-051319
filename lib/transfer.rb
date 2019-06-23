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
    if sender.valid?
        sender.deposit(-amount)
        receiver.deposit(amount)
        @status = "complete"
        @amount_amt_trans = @amount
        @amount = 0 #to prevent another transfer
      end

    if not sender.valid?
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if @status == "complete" && (sender.valid? && receiver.valid?)
      sender.deposit(@amount_amt_trans)
      receiver.deposit(-@amount_amt_trans)
    end
  end
end
