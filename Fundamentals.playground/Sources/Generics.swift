import Foundation

public func main(){
    print("count using integer: \(countItem([1,2,3,4]))")
    print("count using double: \(countItem([1.0,2.0,3.0,4.0]))")
//    print("count using string: \(countItem([1,2,3,4]))")
}

func countItem<Number>(_ item: [Number]) -> Number {
    return 0 as! Number
}
