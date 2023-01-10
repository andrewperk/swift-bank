// The SwiftBank
struct SwiftBank {
  private let password: String
  private var balance: Double = 0 {
    didSet {
      // If balance is less than 100 display low balance message
      if (self.balance < 100) {
        self.displayLowBalanceMessage()
      }
    }
  }

  // Bonus rate for deposits
  static let depositBonusRate: Double = 0.01

  // Setups bank account with password and optional deposit
  init(password: String, initialDeposit: Double) {
    self.password = password
    self.makeDeposit(ofAmount: initialDeposit)
  }

  // Checks if user is validated to access this account
  private func isValid(_ enteredPassword: String) -> Bool {
    if enteredPassword == self.password {
      return true
    } else {
      return false
    }
  }

  // Calculates deposit with bonus
  private func finalDepositWithBonus(fromInitialDeposit deposit: Double) -> Double {
    return deposit + (deposit * SwiftBank.depositBonusRate)
  }

  // Makes a deposit, updates balance
  mutating func makeDeposit(ofAmount depositAmount: Double) {
    let depositWithBonus = self.finalDepositWithBonus(fromInitialDeposit: depositAmount)
    print("Making a deposit of $\(depositAmount) with a bonus rate. The final amount deposited is \(depositWithBonus)")
    self.balance += depositWithBonus
  }

  // Checks password, then displays balance
  func displayBalance(usingPassword password: String) {
    if isValid(password) {
      print("Your current balance is $\(self.balance)")
    } else {
      print("Error: Invalid password. Cannot retrieve balance.")
      return
    }
  }

  // Checks password then makes a withdrawal updating the balance
  mutating func makeWithdrawal(ofAmount withdrawalAmount: Double, usingPassword password: String) {
    if isValid(password) {
      self.balance -= withdrawalAmount
      print("Making a $\(withdrawalAmount) withdrawal.")
    } else {
      print("Error: Invalid password. Cannot make withdrawal.")
      return
    }
  }

  // Displays low balance method in Observer
  private func displayLowBalanceMessage() {
    print("Alert: Your balance is under $100")
  }
}

// Setup bank with password and $500
var andrew: SwiftBank = SwiftBank(password: "pass123", initialDeposit: 500)
// Deposit 50
andrew.makeDeposit(ofAmount: 50)
// Make withdrawal with incorrect password
andrew.makeWithdrawal(ofAmount: 100, usingPassword: "pass122")
// Make withdrawal with correct password
andrew.makeWithdrawal(ofAmount: 100, usingPassword: "pass123")
// Check balance
andrew.displayBalance(usingPassword: "pass123")











