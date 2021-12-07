class BankCard:
    
    @property
    def balance(self):
        if self.total_sum == 0:
            print("Not enough money to learn the balance.")
            raise ValueError
        else:
            self.total_sum = self.total_sum - 1
            return(self.total_sum)
    
    def __init__(self, total_sum):
        self.total_sum = total_sum

    def __repr__(self):
        return("To learn the balance you should put the money on the card, spent some money or get the bank data. The last procedure is not free and costs 1 dollar.")
    
    def __call__(self, y):
        if y <= self.total_sum:
            self.total_sum = self.total_sum - y
            print ("You spent " + str(y) + " dollars. " + str(self.total_sum) + " dollars are left.")
        else:
            print("Not enough money to spent " + str(y) + " dollars")
            raise ValueError

    def put(self, y):
        self.total_sum += y
        print("You put " + str(y) + " dollars. " + str(self.total_sum) + " dollars are left.")
