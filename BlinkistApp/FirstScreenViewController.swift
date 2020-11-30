import UIKit

class FirstScreenViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    private let reuseIdentifier = "Book"
    
    var data: [BookData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO:// call DataLoader.LoadDataClosure here
        
        DataLoader().loadDataClosure() { (bookData) in self.data = bookData}
        
        // TODO:// call DataLoader.LoadDataProtocol here
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? BookCell else {
            fatalError("Unable to dequeue PersonCell.")
        }
        let indexData = data[indexPath.row]
        cell.author.text = indexData.author
        cell.title.text = indexData.title
        cell.book_type.text = indexData.book_type
        cell.access.text = indexData.access
        cell.length.text = "\(indexData.length / 60)hr \(indexData.length % 60)min"
        cell.picture.image = UIImage(named: indexData.image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let indexData = data[indexPath.row]
        performSegue(withIdentifier: "GoToDetailsScreen", sender: indexData)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let data = sender as? BookData {
            if let destinationViewController = segue.destination as? DetailsScreenViewController {
                destinationViewController.data = data
            }
            
        }
    }
    
    


}

