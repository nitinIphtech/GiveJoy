//
//  CreatePostViewController.swift
//  GiveJoy
//
//  Created by iPHTech 34 on 15/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit
import Foundation

class CreatePostViewController: UIViewController,UINavigationControllerDelegate,
UIImagePickerControllerDelegate,UIDocumentPickerDelegate{
    
    @IBOutlet weak var takePhotoButton:CustomButton!
    @IBOutlet weak var choosePhotoButton:CustomButton!
    @IBOutlet weak var selectFriendsButton:CustomButton!
    
    
    @IBOutlet weak var postBtn: CustomButton!
    @IBOutlet weak var cancelBtn: CustomButton!
    
    var imagePicker = UIImagePickerController()
        

        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationController?.navigationBar.isHidden = true

            takePhotoButton.setCornerRadius()
            choosePhotoButton.setCornerRadius()
            selectFriendsButton.setCornerRadius()
            

            takePhotoButton.setActive()
            choosePhotoButton.setInactive()
            selectFriendsButton.setInactive()


            self.postBtn.backgroundColor = UIColor(hexString: "#FFB900")
            self.postBtn.setTitleColor(UIColor(hexString: "#31156C"), for: .normal)
            self.cancelBtn.backgroundColor = UIColor(hexString: "#E9EBEF")
            self.cancelBtn.setTitleColor(UIColor(hexString: "#78849E"), for: .normal)

    }
        

        @IBAction func takePhotoButtonTapped(_ sender: Any) {
            
            takePhotoButton.setActive()
            choosePhotoButton.setInactive()
            selectFriendsButton.setInactive()
            self.openCamera()
        }
        
        @IBAction func choosePhotoButtonTapped(_ sender: Any) {
            takePhotoButton.setInactive()
            choosePhotoButton.setActive()
            selectFriendsButton.setInactive()
            self.openGallery()
        }
        
        @IBAction func selectfriendsButtonTapped(_ sender: Any) {
            takePhotoButton.setInactive()
            choosePhotoButton.setInactive()
            selectFriendsButton.setActive()
            
            let destination = self.storyboard?.instantiateViewController(withIdentifier: "CreatePostFriendTableViewController") as! CreatePostFriendTableViewController
                self.navigationController?.pushViewController(destination, animated: true)
                //self.present(destination, animated: true, completion: nil)
            
        }
        
        @IBAction func postButtonTapped(_ sender: Any) {
            
            navigationController?.popViewController(animated: true)


            
        }
        @IBAction func cancelButtonTapped(_ sender: Any) {

            
            navigationController?.popViewController(animated: true)
            
        }
        @IBAction func backButtonTapped(_ sender: Any) {
            navigationController?.popViewController(animated: true)

        }
        
        func openCamera()
        {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
            else
            {
                let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }

        
        func openGallery()
        {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = true
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }
            else
            {
                let alert  = UIAlertController(title: "Warning", message:  "You don't have permission to access gallery.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let imgUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL{
                let imgName = imgUrl.lastPathComponent
                
                print(imgName)
            }
            if let pickedImage = info[.originalImage] as? UIImage {
    //                self.profileImg.image = pickedImage
    //                userDefault.removeObject(forKey: "profilePic")
                   // img = pickedImage //Change to be from UIPicker
                UIGraphicsBeginImageContextWithOptions((pickedImage.size), false, (pickedImage.scale))
                pickedImage.draw(in: CGRect(origin: .zero, size: (pickedImage.size)))
              //  img = UIGraphicsGetImageFromCurrentImageContext()!
                UIGraphicsEndImageContext()

                //   if let fileURL = self.getFileLocalUrl(image:pickedImage, imageNumber:"1"){
                  //   self.fileUrls.removeAll()
                //     self.fileUrls.append(fileURL)
                  // }
            }
            picker.dismiss(animated: true, completion: nil)
        }

    }


    extension UINavigationController {
      func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
          popToViewController(vc, animated: animated)
        }
      }
    }
