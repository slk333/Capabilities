import UIKit
import MapKit

class MapViewController: UIViewController,CLLocationManagerDelegate {
   let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        locationManager.delegate = self
        
        let trackingBarButton = MKUserTrackingBarButtonItem(mapView: mapView)
        navigationItem.rightBarButtonItem = trackingBarButton
        // Do any additional setup after loading the view.
     locationManager.requestWhenInUseAuthorization()
        
    }
    
    
 

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
