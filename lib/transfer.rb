class Transfer
  attr_accessor :amount, :status, :sender, :receiver

  def initialize(sender,receiver,amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid?
      receiver.balance += amount
      sender.balance -= amount
      self.status = "complete"
    else
      status = "rejected"
      puts "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if status = "complete"
      receiver.balance -= amount
      sender.balance += amount
      status = "reversed"
    end
  end
end
