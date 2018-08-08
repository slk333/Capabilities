import UIKit
import CoreData





class NoteViewController: UIViewController{
    
    let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var textView: UITextView!
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        textView.resignFirstResponder()
        
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        let note = getNote()
        note.text = textView.text
        try! context.save()
        textView.resignFirstResponder()
        
    }
    
    func createDefaultNote(){
        let note = Note(context: context)
        note.text = textView.text
        try! context.save()
    }
    
    func getNote()->Note{
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        let notes = try! context.fetch(fetchRequest)
        return notes.first!
    }
    
    
    
    
    
    
    
    @IBAction func load(_ sender: UIBarButtonItem) {
        
        let note = getNote()
        textView.text = note.text
        
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        let notes = try! context.fetch(fetchRequest)
        if notes.isEmpty {
            createDefaultNote()
        }
        
    
        
    }
    
    
}

