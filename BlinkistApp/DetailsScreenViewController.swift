

import UIKit

class DetailsScreenViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var access: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var length: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    var data: BookData?
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = data?.title
        access.text = data?.access
        author.text = data?.author
        
        descriptionLabel.text = data?.description
        
    }
    


}
