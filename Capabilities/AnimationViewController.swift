import UIKit

class AnimationViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    
    @IBAction func reset(_ sender: Any) {
        
         UIView.animate(withDuration: 1) {
            self.image.layer.position.x = 180
            self.image.layer.position.y = 400
            self.image.layer.transform = CATransform3DIdentity
            
            
             }
    }
    
    
    @IBAction func animate(_ sender: UIBarButtonItem) {
        
    
        UIView.animate(withDuration: 1) {
            self.image.layer.position.x += CGFloat(Float.random(in: -50...50))
             self.image.layer.position.y += CGFloat(Float.random(in: -50...50))
            
            
            let rotationTransform = CATransform3DMakeRotation(CGFloat.pi * CGFloat(Float.random(in: -1...1)), CGFloat(Float.random(in: -1...1)), CGFloat(Float.random(in: -1...1)), CGFloat(Float.random(in: -1...1)))
            
            
            
            let scaleFactor = CGFloat(Float.random(in: 0...2))
            let scaleTransform = CATransform3DMakeScale(scaleFactor, scaleFactor, 1)
            
            let resultTransform = CATransform3DConcat(rotationTransform, scaleTransform)
            
           
            self.image.layer.transform = resultTransform
            
            
            
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
}
