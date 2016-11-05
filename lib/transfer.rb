class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if status != 'complete' && sender.balance >= amount && both_valid?
      sender.deposit(-amount)
      receiver.deposit(amount)
      self.status = 'complete'
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = 'rejected'
    return "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if status == 'complete' and receiver.balance >= amount
      sender.deposit(amount)
      receiver.deposit(-amount)
      self.status = 'reversed'
    else
      reject_transfer
    end
  end

end