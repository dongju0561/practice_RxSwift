//
//  testFile.swift
//  practice_RxSwift
//
//  Created by Dongju Park on 2023/01/03.
//

import Foundation
import RxSwift

let hello = Observable.just("hello RX")
let FBN = Observable.from([0,1,1,2,3,5,8])
let dictS = Observable.from(1:"hello",2:"world")


//subscribe observable sequence
//
let subscrpition = hello.subscribe{ event in
    print(event)
}
