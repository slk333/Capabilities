import UIKit
import CoreData





class NoteViewController: UIViewController {
    
    let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var textView: UITextView!
    
    
    @IBAction func load(_ sender: UIBarButtonItem) {
        
        textView.text = "Nothing has been saved yet!"
        
        let note = Note(context: context)
        note.text = "LUL"
        note.title = "LUL TITLE"
        try! context.save()
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        
    }
    
    
}
