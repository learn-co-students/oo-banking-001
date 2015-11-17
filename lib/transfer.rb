class Transfer

  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize (sender, receiver, amount)
    @status = "pending"
    @amount = amount
    @sender = sender
    @receiver = receiver
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.balance > amount && status != "complete"
     sender.balance -= amount
     receiver.balance += amount
     self.status = "complete"
    else
     self.reject_transfer
      
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance." 
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end