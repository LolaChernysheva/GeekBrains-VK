import UIKit

private let reuseIdentifier = "Photo"

class PhotoController: UICollectionViewController {
    
    @IBAction func likeClick(_ sender: Any) {
        (sender as! LikeButton).like()
    }
    var gottenUserName = ""
    var photoCollection = [1]
    var friend: Friend = Friend()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // self.collectionView!.register(PhotoCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return photoCollection.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Photo", for: indexPath) as! PhotoCell
        cell.userName.text = friend.name
        cell.photo.image = UIImage(named: friend.avatarPath)
        return cell
    }
}
class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
}
