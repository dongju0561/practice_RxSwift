//import Foundation
//import RxSwift
//
//let hello = Observable.of("hello Rx")
//let listS = Observable.from([1,2,4])
//
//let subscriptionHello = hello.subscribe{ event in
//    print(event)
//}
//
//let subscriptionList = listS.subscribe{ event in
//    print(event)
//}
///*
//RxSwift에서 이벤트의 상태는 크게 세가지로 이루어진다.
//next(value:T) : observable sequence의 value
//
//error(error:Error)
//
//completed: 정상적으로 sequence가 끝나게 된다면 completed event를 구독자에게 보낸다.
//
// */
//
//
//let helloSequence = Observable.from(["H","e","l","l","o"])
//let subscription = helloSequence.subscribe { event in
//  switch event {
//      case .next(let value):
//          print(value)
//      case .error(let error):
//          print(error)
//      case .completed:
//          print("completed")
//  }
//}
//
///*
// 구독을 취소하고 싶다면 dispose를 호출함으로서 구독을 취소할 수 있다.
// 그리고 disposebag를 통해서도 구독을 취소할 수 있는데 추가적으로 구독을 취소할때 특정동작과 함께 구독을 취소할 수 있다.
//
// */
//
//let bag = DisposeBag()
//
//let observable = Observable.just("Hello Rx")
//
//let subscriptionll = observable.subscribe(onNext: {
//    print($0)
//})
////subscriptionll.disposed(by: bag)
//
///*
// subjects는 특수한 형태의 observable sequence이다.
// 구독할 수 있고, 동적으로 subject에 요소를 추가할 수 있다.
// */
//
//let subject = PublishSubject<String>()
//
//let subScriptionPublisher = subject.subscribe{ string in
//    print(string)
//}

//subject.onNext("hello world")

/*
 behavior subject는 publish subject와 유사하지만 생성을 할때 항상 초기화를 해주어야하고
 발생한 이벤트 중 가장 최신의 이벤트만 전달 받는다.
 */

/*
 replay subject는 "BufferSize"와 함께 생성, behavior subject와 유사하지만 BufferSize만큼의 최신 이벤트만 전달받는다.
 */

/*
 variable는 behavior subject와 똑같은 동작을 수행한다(발생한 시점 이전의 가장 최신의 이벤트만 전달)
 */


