import UIKit
import UserNotifications
class NotificationVC: UIViewController, UNUserNotificationCenterDelegate{
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("received notification while foreground")
        
        completionHandler(.sound)
        center.removeAllDeliveredNotifications()
        print(notification.request.content.title)
  
        
    
        
    }

    
    let notificationCenter = UNUserNotificationCenter.current()
    
    
    @IBAction func queueNotification(_ sender: UIButton) {
        // verifier que c'est autorisé
        notificationCenter.getNotificationSettings { (notificationSettings) in
            // Do not schedule notifications if not authorized.
            guard notificationSettings.authorizationStatus == .authorized else {return}
            
            if notificationSettings.alertSetting == .enabled {
                self.scheduleNotification()
            }
            else {
                // Schedule a notification with a badge and sound.
              
            }
        }
        
        
    }
    
    func scheduleNotification(){
        
        let content = UNMutableNotificationContent()
        content.title = "Here to serve you"
        content.body = "The notification you ordered"
        content.badge = 1
        
        // Configure the recurring date.
        let date = Calendar.current.date(byAdding: .second, value: 10, to: Date())!
        let components = Calendar.current.dateComponents([.day,.hour,.minute,.second], from: date)
        
        // Create the trigger as a repeating event.
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        // Create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                                            content: content, trigger: trigger)
      
        
        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if error != nil {
                // Handle any errors.
                print(error ?? "")
            }
            else{
                print("notification queued")
            }
            
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.delegate = self
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        notificationCenter.requestAuthorization(options: [.alert, .sound,.badge])
        { (granted, error) in
            
        }
        
        
        
        
        notificationCenter.removeAllDeliveredNotifications()
       UIApplication.shared.applicationIconBadgeNumber = 0

    }

    
}
