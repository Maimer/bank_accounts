class BankAccount
  attr_reader :account

  def initialize(account, amount, transactions)
    @account = account
    @start_balance = amount
    @transactions = transactions
  end

  def starting_balance
    @start_balance
  end

  def current_balance
    spent = 0
    @transactions.each do |item|
      spent += item.amount.to_f
    end
    @start_balance.to_f + spent
  end

  def summary
    @transactions.each do |item|
      item.summary
    end
    return nil
  end
end
