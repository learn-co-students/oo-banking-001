class Transfer
  # code here
  attr_reader :sender, :receiver, :amount
  attr_accessor  :status

  def initialize(sender, receiver, amt)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amt
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.sender.valid? && sender.balance >= @amount
      if self.status != "complete"
        self.sender.balance -= @amount
        self.receiver.balance += @amount
        self.status = "complete"
      end
    else self.reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += @amount
      self.receiver.balance -= @amount
      self.status = "reversed"
    end
  end





end