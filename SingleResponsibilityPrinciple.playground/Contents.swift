import UIKit

// Single Responsibility

// NONSOLID (Not Preferred)
class NONSOLID_Account{
    var firstName: String?
    var lastName: String?
    var street: String?
    var zipCode: String?
    var city: String?
    var country: String?
    var accountId: String?
    var username: String?
    var password: String?
    
    func changePassword(newPassword: String){
        print("Changed password to \(newPassword)")
    }
    func changeAddres(street: String, zicode: Int, city: String) {
        print("Changed")
    }
    func getAccountHolderFirstname() -> String{
        return "firstname"
    }
    func getAccountHolderLastname() -> String{
        return "lastname"
    }
    func depositeMoney(price: Int){
        print("Added = \(price)")
    }
    func withdrawMoney(price: Int) {
        print("Was taken = \(price)")
    }
    func login(username: String){
        print("Logged = \(username)")
    }
    func logout(username: String) {
        print("Logout = \(username)")
    }
}


// SOLID (Preferred)
struct Account{
    var accountId: Int
    var person: Person
    var address: Address
    var login: LoginInfo
}

struct Person{
    var firstName: String
    var lastName: String
}

struct Address{
    var street: String
    var zipCode: Int
    var city: String
    var country: String
}

struct LoginInfo{
    var username: String
    var password: String
}

struct AccountService{
    func deposite(money: Double) {
        print("Deposite \(money)")
    }
    func withDraw(money: Double){
        print("Withdraw = \(money)")
    }
}

struct AddressService{
    func change(newAddress: Address, account: inout Account){
        account.address = newAddress
    }
}

struct AuthenticateService{
    func login(info: LoginInfo){
        print("Logged = \(info.username)")
    }
    
    func logout(info: LoginInfo){
        print("Logout = \(info.username)")
    }
    
    func changePassword(loginInfo: inout LoginInfo, newPassword: String){
        loginInfo.password = newPassword
    }
}

enum AddressType{
    case customer
    case employee
}

enum AddressVerifierError: Error{
    case invalidType
}

class AddressVerifier{
    func isAddressValid(address: Address, type: AddressType) throws -> Bool{
        switch type {
        case .customer:
            return address.city != "Ankara"
        case .employee:
            return address.country != "Turkey"
        }
    }
}
