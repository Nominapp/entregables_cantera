class Account
  attr_reader :name, :balance
  def initialize(name, balance=100)
    @name = name
    @balance = balance
  end
  def display_balance(pin_number)
    puts pin_number == pin ? "Balance: #{@balance}" : pin_error
  end

  def withdraw(pin_number, amount)
    if pin_number == pin && @balance > amount
      puts "Withdrew #{amount}. New balance $#{@balance}."
    elsif pin_number == pin && @balance < amount
      puts overdraw_error
    else
      puts pin_error
    end
  end

  def deposit(pin_number, amount)
    if pin_number == pin
      @balance += amount
      puts "Deposited #{amount}. New balance $#{@balance}."
    else
      puts pin_error
    end
  end

  private
  def pin
    @pin = 1234
  end

  def pin_error
    "Access denied: incorrect PIN."
  end

  def overdraw_error
    "Withdraw denied: the amount specified exceeds the balance."
  end
end

class SavingsAccount < Account
end

# Test

checking_account = Account.new("Scrooge McDuck", 1_000_000_000)
checking_account.withdraw(1234, 1_000_000_000_000)
checking_account.deposit(1234, 9_000_000_000)
checking_account.display_balance(1234)
checking_account.withdraw(1235, 1_000_000_000_000)
checking_account.withdraw(1234, 1_000_000_000)
checking_account.display_balance(1234)
