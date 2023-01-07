/*
 Scheduler는 multithread를 조작하기 위한 rx의 하나의 요소이다.
 작업을 다른 scheduler에 할당할 수도 있고(observeOn(scheduler)를 사용하여),
 특정 schduler에서 sequence 생성과 dispose를 시킬 수도 있다(subscribeOn(scheduler)).
 */
import Foundation
import RxSwift

/*
 observeOn는 observer가 어떤 observerable을 어떤 쓰레드에서 관찰할(observable) 설정해줄 수 있다.
 subscribeOn는 구독에서 사요할 스레드를 지정한다.
 따로 observeOn()이든 subscribeOn()을 설정해주지 않는다면 현재 위치한 쓰레드에서 작업을 진행하게 된다.
 */
let backgroundScheduler = ConcurrentDispatchQueueScheduler(queue: DispatchQueue.global()) // backgound 쓰레드 객체를 생성해주었다.
let sequence1 = Observable.of(1,2,3)

sequence1
    .observe(on: backgroundScheduler) // observeOn -> observe(on: )으로 변경됨
    .map {_ in
        print("background")
    }
    .observe(on: MainScheduler.instance)
    .map{_ in
        print("main")
    }
let backgroundScheduler1 = SerialDispatchQueueScheduler(internalSerialQueueName: "d")
sequence1
    .observe(on: backgroundScheduler1)
    .map{ $0 * 2 }
    .subscribeOn(MainScheduler.instance)
    .subscribeNext{
        print("Result : ($0)")
    }
