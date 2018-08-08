import UIKit
import CoreMotion

class MotionViewController: UIViewController {
    
    let motion = CMMotionManager()
    var timer : Timer?
    
    @IBOutlet weak var image: UIImageView!
    var imageX = CGFloat()
    var imageY = CGFloat()
    
    @IBAction func restart(_ sender: Any) {
       
        timer?.invalidate()
        motion.stopDeviceMotionUpdates()
        
        
        startDeviceMotion()
        

        
        
    }
    func startDeviceMotion() {
        if motion.isDeviceMotionAvailable {
            self.motion.deviceMotionUpdateInterval = 1.0 / 60.0
            self.motion.showsDeviceMovementDisplay = true
            self.motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical)
            
            // Configure a timer to fetch the motion data.
            self.timer = Timer(fire: Date(), interval: (1.0/60.0), repeats: true,
block: { (timer) in
    if let data = self.motion.deviceMotion {
       
        let x = data.attitude.roll
        let y = data.attitude.pitch
        
       
        
       let xOffset = x / .pi * 2 * 115.0 * 4
        self.image.layer.position.x = CGFloat(187.0 + xOffset)
       
        let yOffset = y / .pi * 2 * 325.0 * 2
        self.image.layer.position.y = CGFloat(364.5 + yOffset)
       
       
        
        
        // print(y)
        //  print(z)
        
        // Use the motion data in your app.
    }
})

            // Add the timer to the current run loop.
            RunLoop.current.add(self.timer!, forMode: .default)
        }
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageX = image.layer.position.x
        imageY = image.layer.position.y
        
        print(imageX)
        print(imageY)
        
        
        startDeviceMotion()
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer?.invalidate()
        motion.stopDeviceMotionUpdates()
        print("timer killed")
    }
    
    
    
}
