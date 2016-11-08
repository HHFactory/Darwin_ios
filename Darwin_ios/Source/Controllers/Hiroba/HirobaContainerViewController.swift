
/**
 ひろばタブContainerView用VC
 カメラボタンをつけるためにContainerViewを使用
 ひろばCollectionViewをembedし、カメラボタンを配置
 */

import UIKit

class HirobaContainerViewController: UIViewController {
    
    @IBOutlet weak var cameraButton: UIButton!

    /**
     初期化処理
     
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title
    }
    
    /**
     カメラボタンタップ時処理
     
     - parameter sender: <#sender description#>
     */
    @IBAction func cameraButtonPushed(sender: AnyObject) {
        let actionSheet = UIAlertController(title: "camera action", message: "actionSheet", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "cancel", style: .Cancel, handler: nil)
        let defaultAction = UIAlertAction(title: "default", style: .Default, handler: nil)
        let defaultAction2 = UIAlertAction(title: "default2", style: .Default, handler: nil)
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(defaultAction)
        actionSheet.addAction(defaultAction2)
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    /**
     遷移先から戻ってくる場合の処理
     
     - parameter segue: <#segue description#>
     */
    @IBAction func backToPreView(segue: UIStoryboardSegue){}
}


extension HirobaContainerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}