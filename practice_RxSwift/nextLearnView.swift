import UIKit
import RxSwift
class nextLearn: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func pressJust1(_ sender: UIButton) {
        Observable.just("Hello World")
            .subscribe(onNext: { str in
                print(str)
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func pressJust2(_ sender: UIButton) {
        Observable.just(["Hello", "World"])
            .subscribe(onNext: { str in
                print(str)
            })
            .disposed(by: disposeBag)
    }
    @IBAction func pressFrom1(_ sender: UIButton) {
        Observable.from(["Hello", "World"])
            .subscribe (onNext: { str in
                print(str)
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func pressMap1(_ sender: UIButton) {
        Observable.just("hello")
            .map{str in "\(str) RxSwift"}
            .subscribe(onNext: { str in
                print(str)
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func pressMap2(_ sender: UIButton) {
        Observable.from(["with","dongju"])
            .map {$0.count}
            .subscribe(onNext: {str in
                print(str)
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func pressFilter1(_ sender: UIButton){
        Observable.from([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
            .filter { $0 % 2 == 0 }
            .subscribe(onNext: { n in
                print(n)
            })
            .disposed(by: disposeBag)
        
    }
    
    @IBAction func pressMap3(_ sender: UIButton) {
        Observable.just("800x600")
            .map { $0.replacingOccurrences(of: "x", with: "/") }
            .map { "https://picsum.photos/\($0)/?random" }
            .map { URL(string: $0) }
            .filter { $0 != nil }
            .map { $0! }
            .map { try Data(contentsOf: $0) }
            .map { UIImage(data: $0) }
            .subscribe(onNext: { image in
                self.image.image = image
            })
            .disposed(by: disposeBag)
    }
    
}
