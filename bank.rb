require_relative 'bank_transaction'
require_relative 'bank_account'
require 'csv'
require 'pry'

balances = []
CSV.foreach('balances.csv', headers: true) do |row|
  balances << row.to_hash
end

transactions = []
CSV.foreach('bank_data.csv', headers: true) do |row|
  transactions << row.to_hash
end

bank_data = []
transactions.each do |item|
  bank_data << BankTransaction.new(item["Date"], item["Amount"],
                                   item["Description"], item["Account"])
end

accounts = []
balances.each do |account|
  trans = []
  bank_data.each do |item|
    if item.account == account["Account"]
      trans << item
    end
  end
  accounts << BankAccount.new(account["Account"], account["Balance"], trans)
end

accounts.each do |account|
  puts "==== " + account.account + " ===="
  puts sprintf("%-15s %-10s", "Staring Balance: ", "$" + '%.2f' % account.starting_balance)
  puts sprintf("%-17s %-10s", "Ending Balance: ", "$" + '%.2f' % account.current_balance.to_s)
  puts
  puts account.summary
  puts "========"
  puts
end
