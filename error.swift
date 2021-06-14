import UIKit


class User {
    var name: String
    var walletBalance: Double
    
    init(name: String, walletBalance: Double) {
        self.name = name
        self.walletBalance = walletBalance
    }
}


class Item {
    var bookName: String
    var price: Double
    var qtyLeft: Int

    init(bookName: String, price: Double, qtyLeft: Int){
        self.bookName = bookName
        self.price = price
        self.qtyLeft = qtyLeft
    }
}


let user1 = User(name: "Wisdom Ekpot", walletBalance: 5000)
let storeItem = Item(bookName: "Oliver Twist", price: 1000, qtyLeft: 0)


enum PurchaseError: Error {
    case InsufficentWalletBalance
    case InsufficentBookQty
}

func purchaseBookFromStore (user: User, book: Item) throws {
    
    if user.walletBalance < book.price{
        throw PurchaseError.InsufficentWalletBalance
    }
    
    if  book.qtyLeft <= 0 {
        throw PurchaseError.InsufficentBookQty
    }

    user.walletBalance -= book.price
    book.qtyLeft -= 1
    
    print("\(user.name) successfully purchased \(book.bookName) from the store at \(book.price) naira")
    print("Total number of books remaining = \(book.qtyLeft)")
    print("New wallet balance =  \(user.walletBalance)")
}

do{
    try purchaseBookFromStore(user: user1, book: storeItem)
}catch PurchaseError.InsufficentWalletBalance {
    print("You don't have sufficent funds to carry out this transaction")
}catch PurchaseError.InsufficentBookQty{
    print("Insufficent item quantity")
}catch{
    print("Something went wrong")
}