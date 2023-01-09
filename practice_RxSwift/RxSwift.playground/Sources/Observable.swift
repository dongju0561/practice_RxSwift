/*
 observable은 "관찰할 수 있는"이라는 뜻이다. 이것을 유튜브로 비유하자면 결국 observable은 유튜버라고 할 수 있다.
 그리고 구독자(observer)들은 구독(subscribe)을 함으로서 유튜버의 영상을 볼 수 있게된다.
 이때 RxSwift상의 youtube는 무조건 구독을 해야만 영상을 볼 수 있게된다.. (현실세계에서 알고리즘을 통해 무작위 영상을 보는 시스템이 없다.)
 하나의 유튜버는 하나의 컨텐츠(Int, String, Double etc)만 영상을 만들 수 있다.
 */
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

//range observable: range()메소드는 start 값부터 count 값까지 1씩 증가하면서 subscribe에 정의된 클로저의 인자에 대입하여 
let observable7 = Observable<Int>.range(start: 1, count: 10)

observable7.subscribe { i in
    let n = Double(i)
    let fibonacci = Int(((pow(1.61903, n)-pow(0.61803, n))/2.23606).rounded())
    print(fibonacci)
}
