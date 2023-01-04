import Foundation
import RxSwift

let hello = Observable.of("hello Rx")
let listS = Observable.from([1,2,4])

let subscriptionHello = hello.subscribe{ event in
    print(event)
}

let subscriptionList = listS.subscribe{ event in
    print(event)
}
/*
RxSwift에서 이벤트의 상태는 크게 세가지로 이루어진다.
next(value:T) : observable sequence의 value

error(error:Error)

completed: 정상적으로 sequence가 끝나게 된다면 completed event를 구독자에게 보낸다.

 */


let helloSequence = Observable.from(["H","e","l","l","o"])
let subscription = helloSequence.subscribe { event in
  switch event {
      case .next(let value):
          print(value)
      case .error(let error):
          print(error)
      case .completed:
          print("completed")
  }
}

/*
 구독을 취소하고 싶다면 dispose를 호출함으로서 구독을 취소할 수 있다.
 그리고 disposebag를 통해서도 구독을 취소할 수 있는데 추가적으로 구독을 취소할때 특정동작과 함께 구독을 취소할 수 있다.

 */

let bag = DisposeBag()

let observable = Observable.just("Hello Rx")

let subscriptionll = observable.subscribe(onNext: {
    print($0)
})
//subscriptionll.disposed(by: bag)

/*
 subjects는 특수한 형태의 observable sequence이다.
 구독할 수 있고, 동적으로 subject에 요소를 추가할 수 있다.
 */

let subject = PublishSubject<String>()

let subScriptionPublisher = subject.subscribe{ string in
    print(string)
}

subject.onNext("hello world")

/*
 publish subject
 */

let subject = PublishSubject<String>()

subject.onNext("Is anyone listening?") //emit

let subscriptionOne = subject.subscribe(onNext: {string in // sequence 생성
    print(string)
})

 sequence(subscriptionOne)에서 발생한것
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


/*
 behavior subject는 publish subject와 유사하지만 생성을 할때 항상 초기화를 해주어야하고
 발생한 이벤트 중 가장 최신의 이벤트만 전달 받는다.
 */
enum MyError: Error{
    case anError
}

let subject = BehaviorSubject(value: "Initial Value") // behavior subject는 생성과 함께 이벤트를 생성해준다.
let disposeBag = DisposeBag()

subject.onNext("X")

subject.subscribe{ //구독을 하면서 바로 이전에 이벤트를 수행해준다. 그러므로 "X"가 emit이 된다.
    print("1)", $0.element ?? $0)
}
.disposed(by: disposeBag)

subject.onNext("hello")

subject.subscribe{
    print("2)", $0.element ?? $0)
}
.disposed(by: disposeBag)

subject.onError(MyError.anError)


subject.subscribe{
    print("3)", $0.element ?? $0)
}
.disposed(by: disposeBag)
                              
/*
 replay subject는 "BufferSize"와 함께 생성, behavior subject와 유사하지만 BufferSize만큼의 최신 이벤트만 전달받는다.
 */
let subject = ReplaySubject<String>.create(bufferSize: 2)
let disposeBag = DisposeBag()

enum MyError : Error{
    case anError
}

subject.onNext("1")
subject.onNext("2")
subject.onNext("3")

subject.subscribe{
    print("1)", $0.element ?? $0)
}
.disposed(by: disposeBag)

subject.onError(MyError.anError) // 에러가 발생하게 된다면 해당 subject는 종료되게 된다.

subject.subscribe{
    print("2)", $0.element ?? $0)
}
.disposed(by: disposeBag)
하지만 에러인한 영향이 버퍼에는 미치지 못하기 때문에 버퍼에는 이벤트가 남아있게 된다.

/*
 variable는 behavior subject와 똑같은 동작을 수행한다(발생한 시점 이전의 가장 최신의 이벤트만 전달)
 */


