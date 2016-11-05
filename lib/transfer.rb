class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def both_valid?
    if self.sender.valid? and self.receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.status != 'complete' and self.sender.balance >= self.amount
      self.sender.deposit(-amount)
      self.receiver.deposit(amount)
      self.status = 'complete'
    else
      self.reject_transfer
    end
  end

  def reject_transfer
    self.status = 'rejected'
    return "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == 'complete' and self.receiver.balance >= self.amount
      self.sender.deposit(amount)
      self.receiver.deposit(-amount)
      self.status = 'reversed'
    else
      self.reject_transfer
    end
  end

end