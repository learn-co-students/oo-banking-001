class BankAccount
  # code here
  attr_accessor :balance, :status
  attr_reader :name
  def initialize(name)
    @name = name
    @balance = 1000
    @status = @balance <= 0 ? "closed" : "open"
  end

  def deposit(amt)
    @balance += amt
  end

  def display_balance
    "Your Balance is $#{@balance}."
  end

  def valid?
    @balance == 0 || @status == "closed" ? false : true
  end

  def close_account
    @status = "closed"
  end
end
