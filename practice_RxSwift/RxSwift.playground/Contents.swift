import UIKit
import RxSwift


let subject = PublishSubject<String>()

subject.onNext("Is anyone listening?") //emit

let subscriptionOne = subject.subscribe(onNext: {string in // sequence 생성
    print(string)
})

// sequence(subscriptionOne)에서 발생한것
subject.on(.next("1"))//emit
subject.onNext("2")//emit

let subscriptionTwo = subject.subscribe({ (event) in //sequence 생성
    print("2)",event.element ?? event)
})
// sequence(subscriptionOne)와 sequence(subscriptionTwo)에서 발생한것
subject.onNext("3")

subscriptionOne.dispose() // dispose와 complete의 차이는 무엇일까 어떤 상황에 구분지어서 사용을 하게 되는것일까??
//dispose를 시켜주는 것은 아마 sequence의 작업 도중에 중단 시키고 싶을때 dispose를 사용하는것 같다.
//complete를 발생하게 된다면 작업들의 중단과 complete라는 문자를 출력하게된다. !! 중단은 되지만 dispose가 되지 않은 상태이다.

subject.onNext("4")
subject.onCompleted()
subscriptionTwo.dispose()

let disposeBag = DisposeBag()

subject.subscribe { // complete되어 끝난 sequence를 subscribe를 했다. => complete가 이미 되었기 때문에 complete를 반환한다.
    print("3)",$0.element ?? $0) // $0의 의미는 클로저의 첫번째 인수를 의미한다. 해당 코드에서 예상되는 인수값은 completed이다.
}
.disposed(by: disposeBag)
subject.onNext("?")
