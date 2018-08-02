import UIKit


@IBDesignable
class DrawView: UIView {

    
    
    
    override func draw(_ rect: CGRect) {
        
        let path=UIBezierPath() // peut être utilisé pour reset le path
        path.move(to: CGPoint(x:146,y:100)) // CREER UN NOUVEAU SUBPATH se déplace à un nouveau point sans tracer de ligne avec le point précédent (faire un nouveau point de départ sans tracer de ligne, autrement dit créer un nouveau subpath)
        path.addLine(to: CGPoint(x: 186, y: 30)) // se déplace à un nouveau point en traçant un trait avec le précédent point
        path.addLine(to: CGPoint(x: 226, y: 100))
        path.close() // trace un trait entre le dernier point et le premier point du subpath en cours
        
        path.move(to: CGPoint(x:106,y:170)) // CREER UN NOUVEAU SUBPATH se déplace à un nouveau point sans tracer de ligne avec le point précédent (faire un nouveau point de départ sans tracer de ligne, autrement dit créer un nouveau subpath)
        path.addLine(to: CGPoint(x: 146, y: 100)) // se déplace à un nouveau point en traçant un trait avec le précédent point
        path.addLine(to: CGPoint(x: 186, y: 170))
        path.close() // trace un trait entre le dernier point et le premier point du subpath en cours
        
        path.move(to: CGPoint(x:186,y:170)) // CREER UN NOUVEAU SUBPATH se déplace à un nouveau point sans tracer de ligne avec le point précédent (faire un nouveau point de départ sans tracer de ligne, autrement dit créer un nouveau subpath)
        path.addLine(to: CGPoint(x: 226, y: 100)) // se déplace à un nouveau point en traçant un trait avec le précédent point
        path.addLine(to: CGPoint(x: 266, y: 170))
        path.close() // trace un trait entre le dernier point et le premier point du subpath en cours
        path.lineWidth=5
        

        
        let tamedRed = UIColor(red: 255/255, green: 105/255, blue: 97/255, alpha: 1)
        
        tamedRed.setFill()
        UIColor.black.setStroke()
        path.stroke()
        path.fill()
        
    }


}
