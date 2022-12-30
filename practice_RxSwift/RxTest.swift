//
//  ViewController.swift
//  practice_RxSwift
//
//  Created by Dongju Park on 2022/12/30.
//

import UIKit
import RxSwift

class UIView: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var counterLabel: UILabel!
    
    var counter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        //비동기 처리를 진행한다는 것을 보여주기 위해 주기적으로 타이머를 동작시키고 상태값을 보여주어 어떻게 상태가 달라지는지 체크
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.counter += 1
            self.counterLabel.text = "\(self.counter)"
        }
    }
    
    @IBAction func loadImage(_ sender: UIButton) {
        image.image = nil
        
        //와일드카드 패턴
        _ = rxswiftLoadImage(from: LARGER_IMAGE_URL)
            .observe(on: MainScheduler.instance)
            .subscribe({ result in
                switch result {
                case let .next(image):
                    self.image.image = image

                case let .error(err):
                    print(err.localizedDescription)

                case .completed:
                    break
                }
            })
    }
    
    @IBAction func cancelLoad(_ sender: UIButton) {
    }
    
    
    func rxswiftLoadImage(from imageUrl: String) -> Observable<UIImage?> {
        return Observable.create { seal in
            asyncLoadImage(from: imageUrl) { image in
                seal.onNext(image)
                seal.onCompleted()
            }
            return Disposables.create()
        }
    }
}

