class BankAccount
  # code here
  attr_reader :name
  attr_accessor :status, :balance

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

    def deposit(amt)
      @balance += amt
    end

    def display_balance
      "Your Balance is $#{self.balance}."
    end

    def valid?
      @status == "open" && @balance > 0
    end

    def close_account
      self.status = "closed"
    end
end