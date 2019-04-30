   
   /*
    let transform = CATransform3DMakeTranslation(
    100,
    0,
    0
    )
    let animation = CABasicAnimation(keyPath: "transform")
    animation.toValue = NSValue(caTransform3D: transform)
    animation.duration = 3
    face1.layer.add(animation, forKey: "transform")
    */
   
   /*
    
    
    
    let scaleFactor = CGFloat.random(in: 0...2)
    
    let scaleTransform = CATransform3DMakeScale(
    scaleFactor,
    scaleFactor,
    1
    )
    
    */
   



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
            .random(in: 0...(.pi)),
            .random(in: -1...1),
            .random(in: -1...1),
            0.0
        )
       
        
        
        let resultTransformLeft = CATransform3DConcat(
            rotationTransformYAxis,
            CATransform3DConcat(
                translateTransformLeft ,
                rotationTransform
            )
        )
        let resultTransformRight = CATransform3DConcat(
            rotationTransformYAxis ,
            CATransform3DConcat(
                translateTransformRight,
                rotationTransform
            )
        )
        let resultTransformTop = CATransform3DConcat(
            rotationTransformXAxis ,
            CATransform3DConcat(
                translateTransformTop,
                rotationTransform
            )
        )
        let resultTransformDown = CATransform3DConcat(
            rotationTransformXAxis ,
            CATransform3DConcat(
                translateTransformDown,
                rotationTransform
            )
        )
        
        let resultTransformBehind = CATransform3DConcat(
            translateTransformBehind,
            rotationTransform
        )
        
        let resultTransformFront = CATransform3DConcat(
            translateTransformFront,
            rotationTransform
        )
        
        
        
        
        //  self.image.layer.transform = resultTransform
        
        face1.layer.transform = resultTransformFront
        face2.layer.transform = resultTransformBehind
        face3.layer.transform = resultTransformLeft
        face4.layer.transform = resultTransformRight
        face5.layer.transform = resultTransformTop
        face6.layer.transform = resultTransformDown
    }
    
    @IBAction func instant(_ sender: Any) {
        
        rotateCube()
    }
    
    
    @IBAction func animate(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseInOut], animations: {
            self.rotateCube()
            
        }, completion: nil)
        
 
    }
    
    
    func createFaces(){
        let faceSize = CGSize(width: 100 * coeff, height: 100 * coeff)
        let center = view.center
        
        
        
        
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
        
        
        
        let verticalOffset = navigationController!.navigationBar.frame.size.height + UIApplication.shared.statusBarFrame.height
        
        
        face1.layer.backgroundColor = pink
        face2.layer.backgroundColor = pink
        face3.layer.backgroundColor = lightPink
        face4.layer.backgroundColor = lightPink
        face5.layer.backgroundColor = lightPurple
        face6.layer.backgroundColor = lightPurple
        
        let correctCenter = CGPoint(x: center.x, y: center.y - verticalOffset)
        
        face1.center = correctCenter
        face2.center = correctCenter
        face3.center = correctCenter
        face4.center = correctCenter
        face5.center = correctCenter
        face6.center = correctCenter
        
        
        print(verticalOffset)
        
        
        
        view.addSubview(face2)
        view.addSubview(face3)
        view.addSubview(face4)
        view.addSubview(face5)
        view.addSubview(face6)
        view.addSubview(face1)
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.isHidden = true
        
    
        
        createFaces()
        rotateCube()
        
    print(view.center.x,view.center.y,view.bounds.minX,view.bounds.maxX,view.bounds.minY,view.bounds.maxY)
        
        print(view.frame)
        print(view.bounds)
        
    }
}
