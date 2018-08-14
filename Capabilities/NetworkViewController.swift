import UIKit
import WebKit

class NetworkViewController: UIViewController {
    
    
    @IBOutlet weak var webView: WKWebView!
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func connect(_ sender: UITextField) {
        
        guard let url = URL(string: sender.text!) else{
            
            self.textView.text = "invalid URL"
            
            
            
            return}
     
        
        triggerHttpRequest(url:url)
        
        
    }
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func triggerHttpRequest(url:URL){
        
        var urlRequest=URLRequest(url: url)
        urlRequest.timeoutInterval = 3
        let dataTask=URLSession.shared.dataTask(with: urlRequest){data,response,error in
        
             self.webView.load(urlRequest)
            
            
            guard let validResponse = response else{
                DispatchQueue.main.async {
                    self.textView.text = "no response"
                }
                return
                
            }
            
            
            guard let validData = data else{
                DispatchQueue.main.async {
                    self.textView.text = "no data"
                }
                
                return}
            
            guard let dataString = String(data: validData, encoding: .utf8) else{
                DispatchQueue.main.async {
                    self.textView.text = "could not transform data to string"
                }
                
                return}
            
            // success
            DispatchQueue.main.async {
                self.view.endEditing(false)
                self.textView.text = validResponse.mimeType
                self.textView.text.append(dataString)
                
            }
        }
        dataTask.resume()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let url = URL(string: "https://slk333.github.io/")!
        let urlRequest = URLRequest(url: url)
        
        
        webView.load(urlRequest)
       

    }

}
