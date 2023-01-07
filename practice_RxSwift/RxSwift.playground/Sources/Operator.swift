/*
 Operator는 Observable에서 방출되는 이벤트를 변환하고 처리하여 대응하는 요소이다.
 
 Operator의 크게 3가지 요소를 가지고 있다.
 - Filtering Operator
 - Tansforming Operator
 - Combining Operator
 */
import Foundation
import RxSwift

/*
 Filtering Operator는 next이벤트를 받아오는 값들을 조건을 달아 선택적으로 받을 수 있게 해준다.
 */
let disposeBag = DisposeBag()
//let testFilterFilter = Observable.of(1,2,3,4,5)
//    .filter({ num -> Bool in //.filter 메소드 조건식에 부합하는 이벤트만 방출
//        num % 2 == 0
//    })
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)
//
//let testFilterSkip = Observable.of(1,2,3,4)
//    .skip(2) // .skip 메소드 skip의 인자를 포함한 전에 이벤트값들을 제외하고 방출
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)
//
//let testFilterSkipwhile = Observable.of(1,6,3,6,4,7,2)
//    .skip(while: { //.skip(while: num -> Bool) 조건식이 true가 나올때까지 skip true가 나올시 차례대로 방출
//        $0 < 5
//    })
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)
//let testFilterTake = Observable.of(1,2,3,4)
//    .take(2) // .take 메소드는 입력받은 갯수만큼의 이벤트를 방출하고 complete한다.
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)
//let testOperatorDistinctUntilChanged = Observable.of(1,2,2,1,3)
//    .distinctUntilChanged() // distinctUntilChanged() 메소드는 이벤트가 연달아 같은 이벤트를 수행하는것을 방지하기 위한 메소드이다.
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)

/*
 Transforming Operator는 Observable을 변형하는 Operator이다.
 */
//let testOperatorMap = Observable.of(1,2,3)
//    .map{
//        $0 * 10 // .map 메소드는 이벤트의 값들을 변형하는 메소드이다.
//    }
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)
//struct Student{
//    var score: BehaviorSubject<Int>
//}
//
//let ryan = Student(score: BehaviorSubject(value: 80))
//let charlotte = Student(score: BehaviorSubject(value: 90))
//
//let student = PublishSubject<Student>()
//
//student
//    .flatMap{
//        $0.score
//    }
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposeBag)
//
//student.onNext(ryan)
//ryan.score.onNext(85)
//student.onNext(charlotte)
//ryan.score.onNext(95)
//charlotte.score.onNext(100)

/*
 Combining Operator는 sequence들을 모으고 sequence 내에 데이터를 병합하는 Operator이다.
 예를 들어 여러 이벤트들을 가지고 있는 sequence 두개가 있을때 특정 규칙에 따라 병합하는 operator를 의미한다.
 */
//let sequence1 = Observable.of(1,2,3)
//let sequence2 = Observable.of(4,5,6)
//
//let sequenceConcat = Observable.concat([sequence1,sequence2])
//// .concat 메소드 같은 경우 병합을 하게 된다면 이벤트들이 들어오는 순서대로 정렬하게되게 된다.
//sequenceMerged.subscribe(onNext: {
//    print($0)
//})

//let sequence3 = Observable.of(1,2,3)
//let sequence4 = Observable.of(4,5,6)
//
//let sequenceMerged = Observable.merge(sequence3,sequence4)
//// .merge 메소드 같은 경우 병합을 하게 된다면 같은 index를 끼리 묶어 정렬하게되게 된다.
//sequenceMerged.subscribe(onNext: {
//    print($0)
//})
