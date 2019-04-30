import UIKit
  var coeff:CGFloat = 2.0
class AnimationViewController: UIViewController {
    
  
    
    @IBOutlet weak var image: UIImageView!
    
    var face1:UIView!
    var face2:UIView!
    var face3:UIView!
    var face4:UIView!
    var face5:UIView!
    var face6:UIView!
    
    let translateTransformLeft = CATransform3DMakeTranslation(
        -50 * coeff,
        0,
        0 * coeff
    )
    let translateTransformFront = CATransform3DMakeTranslation(
        0 * coeff,
        0,
        50 * coeff
    )
    let rotationTransformYAxis = CATransform3DMakeRotation(
        (.pi/2),
        0,
        1,
        0.0
    )
    let translateTransformRight = CATransform3DMakeTranslation(
        50 * coeff,
        0,
        0 * coeff
    )
    let translateTransformTop = CATransform3DMakeTranslation(
        0,
        -50 * coeff,
        0 * coeff
    )
    let translateTransformDown = CATransform3DMakeTranslation(
        0,
        50 * coeff,
        0 * coeff
    )
    let rotationTransformXAxis = CATransform3DMakeRotation(
        (.pi/2),
        1,
        0,
        0.0
    )
    
    
    let translateTransformBehind = CATransform3DMakeTranslation(
        0,
        0,
        -50 * coeff
    )
    
    
    
    func rotateCube(){
        let rotationTransform = CATransform3DMakeRotation(
            .random(in: 0...(.pi)
            ),
            .random(in: -1...1),
            .random(in: -1...1),
            0.0
        )
        
        
        
        
        /*
         
         let translateTransform = CATransform3DMakeTranslation(
         .random(in: -50...50),
         .random(in: -50...50),
         .random(in: -50...50)
         )
         
         let scaleFactor = CGFloat.random(in: 0...2)
         
         let scaleTransform = CATransform3DMakeScale(
         scaleFactor,
         scaleFactor,
         1)
         
         let resultTransform = CATransform3DConcat(
         translateTransform,
         CATransform3DConcat(
         rotationTransform,
         scaleTransform)
         )
         
         */
        
        
        
        
        let resultTransformLeft = CATransform3DConcat(
            self.rotationTransformYAxis,
            CATransform3DConcat(
                self.translateTransformLeft ,
                rotationTransform
            )
        )
        let resultTransformRight = CATransform3DConcat(
            self.rotationTransformYAxis ,
            CATransform3DConcat(
                self.translateTransformRight,
                rotationTransform
            )
        )
        let resultTransformTop = CATransform3DConcat(
            self.rotationTransformXAxis ,
            CATransform3DConcat(
                self.translateTransformTop,
                rotationTransform
            )
        )
        let resultTransformDown = CATransform3DConcat(
            self.rotationTransformXAxis ,
            CATransform3DConcat(
                self.translateTransformDown,
                rotationTransform
            )
        )
        
        let resultTransformBehind = CATransform3DConcat(
            self.translateTransformBehind,
            rotationTransform
        )
        
        let resultTransformFront = CATransform3DConcat(
            self.translateTransformFront,
            rotationTransform
        )
        
        
        
        
        //  self.image.layer.transform = resultTransform
        
        self.face1.layer.transform = resultTransformFront
        self.face2.layer.transform = resultTransformBehind
        self.face3.layer.transform = resultTransformLeft
        self.face4.layer.transform = resultTransformRight
        self.face5.layer.transform = resultTransformTop
        self.face6.layer.transform = resultTransformDown
    }
    
    @IBAction func reset(_ sender: Any) {
        
    rotateCube()
    }
    
    
    @IBAction func animate(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseInOut], animations: {
       
            //    self.image.layer.position.x += CGFloat(Float.random(in: -50...50))
            //     self.image.layer.position.y += CGFloat(Float.random(in: -50...50))
            
            //  self.image.frame = self.image.frame.offsetBy(dx: .random(in: -50...50), dy: .random(in: -50...50))
            
            
            
            
            
            let rotationTransform = CATransform3DMakeRotation(
                .random(in: 0...0.7
                ),
                .random(in: -1...1),
                .random(in: -1...1),
                0.0
            )
            
            
            
            
            /*
             
             let translateTransform = CATransform3DMakeTranslation(
             .random(in: -50...50),
             .random(in: -50...50),
             .random(in: -50...50)
             )
             
             let scaleFactor = CGFloat.random(in: 0...2)
             
             let scaleTransform = CATransform3DMakeScale(
             scaleFactor,
             scaleFactor,
             1)
             
             let resultTransform = CATransform3DConcat(
             translateTransform,
             CATransform3DConcat(
             rotationTransform,
             scaleTransform)
             )
             
             */
            
          
            
            
            let resultTransformLeft = CATransform3DConcat(
                self.rotationTransformYAxis,
                CATransform3DConcat(
                    self.translateTransformLeft ,
                    rotationTransform
                )
            )
            let resultTransformRight = CATransform3DConcat(
                self.rotationTransformYAxis ,
                CATransform3DConcat(
                    self.translateTransformRight,
                    rotationTransform
                )
            )
            let resultTransformTop = CATransform3DConcat(
                self.rotationTransformXAxis ,
                CATransform3DConcat(
                    self.translateTransformTop,
                    rotationTransform
                )
            )
            let resultTransformDown = CATransform3DConcat(
                self.rotationTransformXAxis ,
                CATransform3DConcat(
                    self.translateTransformDown,
                    rotationTransform
                )
            )
            
            let resultTransformBehind = CATransform3DConcat(
                self.translateTransformBehind,
                rotationTransform
            )
            
            let resultTransformFront = CATransform3DConcat(
                self.translateTransformFront,
                rotationTransform
            )
            
            
            
            
            //  self.image.layer.transform = resultTransform
            
            self.face1.layer.transform = resultTransformFront
            self.face2.layer.transform = resultTransformBehind
            self.face3.layer.transform = resultTransformLeft
            self.face4.layer.transform = resultTransformRight
            self.face5.layer.transform = resultTransformTop
            self.face6.layer.transform = resultTransformDown
            
        }, completion: nil)
            
      
            
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.isHidden = true
        
        
        let faceSize = CGSize(width: 100 * coeff, height: 100 * coeff)
        let center = CGPoint(x:view.frame.midX,y:view.frame.midY)
        
        face1 = UIView(frame: CGRect(
            origin: center,
            size: faceSize)
        )
        face2 = UIView(frame: CGRect(
            origin: center,
            size: faceSize)
        )
        face3 = UIView(frame: CGRect(
            origin: center,
            size: faceSize)
        )
        face4 = UIView(frame: CGRect(
            origin: center,
            size: faceSize)
        )
        face5 = UIView(frame: CGRect(
            origin: center,
            size: faceSize)
        )
        face6 = UIView(frame: CGRect(
            origin: center,
            size: faceSize)
        )
        
        
        let pink = UIColor(hue: 0.9056, saturation: 1, brightness: 0.89, alpha: 1.0).cgColor
        let lightPink = UIColor(hue: 0.9222, saturation: 0.3, brightness: 0.92, alpha: 1.0).cgColor
        let lightPurple = UIColor(hue: 0.8, saturation: 0.47, brightness: 0.56, alpha: 1.0).cgColor


        
        
        
        
        face1.layer.backgroundColor = pink

        face2.layer.backgroundColor = pink
        
        face3.layer.backgroundColor = lightPink

        face4.layer.backgroundColor = lightPink
        face5.layer.backgroundColor = lightPurple
        face6.layer.backgroundColor = lightPurple
        
        face2.layer.position = center
        face1.layer.position = center
        face3.layer.position = center
        face4.layer.position = center
        face5.layer.position = center
        face6.layer.position = center
        
        
        
        
        
        
        
        
        
        
        view.addSubview(face1)
        view.addSubview(face2)
        view.addSubview(face3)
        view.addSubview(face4)
        view.addSubview(face5)
        view.addSubview(face6)
        
        
        rotateCube()
        
        
        
        
    }
}
