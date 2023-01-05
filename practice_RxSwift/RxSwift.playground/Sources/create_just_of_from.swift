/*
 create(), .just(), .of(), .from() 메소드들의 차이를 공부!
 */

import Foundation
import RxSwift

let oneItem = "event"
let itemIterable = ["event","tap","tick"]
let elemet3 = "tick"

/*
 create(): create() 메소드 같은 경우 클로저 형태의 인자를 받게 된다.
 
 create() VS just(), from(), of()
 just(), from(), of() 같은 경우 observable에 들어간 이벤트만 넣어주게 된다면 알아서 observable을 만들어주게 된다.
 create() 같은 경우 next(), completed(), disposable() 동작을 정의해줄 수 있다.(from scratch)
 */

// 여러 create() 메소드 구현 소스코드를 확인해 보면 함수 형태로 이벤트들을 받을 준비를 하는 create()를 구현한것을 확인할 수 있다.

//iterable 형태로 이벤트를 전달 받을때를 위한 함수 정의
func myFrom<E>(_ sequence: [E]) -> Observable<E>{ // 함수 파라미터를 이벤트 혹은 이벤트들을 받을 준비를 하고 Observable 타입으로 반환하게 된다.
    return Observable.create { observer in // observable을 구독한 observer들의 구체적인 동작(sequence)을 정의하게 된다.(next,completed,disposable)
        for element in sequence{
            observer.on(.next(element))//on 메소드를 통해 subscribe 메소드의 클로저 인자로 전달되게 된다.
        }
        observer.on(.completed)
        return Disposables.create()
    }
}

//단 하나의 이벤트를 전달 받을때를 위한 함수 정의
func myJust<E>(_ sequence: E) -> Observable<E>{
    return Observable.create { observer in
        observer.on(.next(sequence))
        observer.on(.completed)
        return Disposables.create()
    }
}
let observableCreateFrom = myFrom(itemIterable) //Observable 생성
let observableCreateJust = myJust(oneItem)

observableCreateFrom.subscribe{
    print($0)
}
observableCreateJust.subscribe{
    print($0)
}
/*
 just(): 단일 이벤트만 emit하는 observable 생성
 만약 iterable 형태로 just()의 인자로 들어오게 된다면 iterable 형태 그대로 emit 될것이다.
 */
let observableJust = Observable.just(oneItem)
observableJust.subscribe{// next(event)
    print($0)
}
let observableJustIterable = Observable.just(itemIterable)
observableJustIterable.subscribe{// next(["event", "tap", "tick"])
    print($0)
}

//of():
let observableOf = Observable.of(oneItem)

let observableFrom = Observable.from(oneItem)
