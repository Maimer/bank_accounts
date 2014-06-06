class BankTransaction
  attr_reader :date, :amount, :description, :account

  def initialize(date, amount, description, account)
    @date = date
    @amount = amount
    @description = description
    @account = account
  end

  def deposit?
    @amount.to_i > 0
  end

  def summary
    type = ""
    deposit? ? type = "DEPOSIT" : type = "WITHDRAWAL"
    puts sprintf("%-10s %-12s %-8s %-10s", "$" + '%.2f' % @amount.to_f.abs.to_s,
                 type, @date, "- " + @description)
  end
end
