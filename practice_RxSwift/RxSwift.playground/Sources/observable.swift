import UIKit
import RxSwift

let one = "1"
let two = "2"
let three = "3"

let observable: Observable<String> = Observable<String>.just(one) // 해당 sequence는 Int타입의 이벤트가 생성될것이다.
//Observable<Int>.just(one)을 통해서 one이라는 딱 하나의(just) 이벤트를 발생시킨다(emit).
let observable2 = Observable.of(one, two, three)
let observable3 = Observable.of([one,two,three])
let observable4 = Observable.from([one,two,three])

//observable만 생성한다고 이벤트를 발생시키지 않느다.
//subscribe를 해주어야만 이벤트를 발생시키게 된다.
observable.subscribe{ event in
    //next에 감싸져 있는 event들을 옵셔널 바인딩을 통해 제거해준다.
    if let element = event.element{
        print(element)
    }
}
//위에처럼 옵셔널 바인딩을 통해 next안에 있는 내용을 꺼져줄 수 있고 onNext 파라미터를 이용해 해당 클로저를 전달해주면 위와 같은 결과를 얻을 수 있다.

//subscribe에 오버로딩된 메소드들중 각각의 이벤트들마다 특정 동작들을 구체적을 정의해줄 수 있다.
observable2.subscribe(
    onNext: { event in
        print(event)
    },

    onCompleted: {
        print("completed")
    }
)

//empty: 이벤트 없을때
let observable5 = Observable<Void>.empty()
//즉시 observable을 반환하고 싶을때 일부로 이벤트를 발생시키지 않는다.

//never observable
let observable6 = Observable<Any>.never()

range observable
let observable7 = Observable<Int>.range(start: 1, count: 10)

observable7.subscribe { i in
    let n = Double(i)
    let fibonacci = Int(((pow(1.61903, n)-pow(0.61803, n))/2.23606).rounded())
    print(fibonacci)
}
