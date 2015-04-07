//
//  PhotoViewController.swift
//  ImageFilterz
//
//  Created by Brandon Roberts on 4/6/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
  @IBOutlet var imageView: UIImageView! //Setting self.currentPhoto changes the viewed photo
  
  let filterService = FilterService()
  var currentPhoto : UIImage? {
    didSet {
      
    }
  }
  
  let alertController = UIAlertController(title: "Edit Photo", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
//  let actionCameraTitle = "Camera"
//  let actionFilter1Title = "Sepia"
//  let actionFilter2Title = "SomethingElse"
//  let actionFilter3Title = "SomethingOther"

  override func viewDidLoad() {
        super.viewDidLoad()
    
    // Check if the camera is available
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
      // Camera is available, so add the actions
      self.alertController.addAction(self.cameraAction())

    } else {
      self.alertController.message = "The camera is not available on this device"
    }
    self.alertController.addAction(self.filter1Action())
    self.alertController.addAction(self.filter2Action())
    self.alertController.addAction(self.filter3Action())
    self.alertController.addAction(self.cancelAction())
  }

  @IBAction func photoButtonPressed(sender: AnyObject) {
    self.presentViewController(self.alertController, animated: true) { () -> Void in
      
    }
  }
  
  //MARK: UIAlertController Actions
  private func cameraAction() -> UIAlertAction {
    let action = UIAlertAction(title: "Take Photo", style: UIAlertActionStyle.Default) { (action) -> Void in
      // TODO: Have the action launch the camera
    }
    return action
  }
  
  private func photoLibraryAction() -> UIAlertAction {
    let action = UIAlertAction(title: "Choose Existing Photo", style: UIAlertActionStyle.Default) { (action) -> Void in
      // TODO: Have the action launch the image picker
    }
    return action
  }
  
  private func filter1Action() -> UIAlertAction {
    let action = UIAlertAction(title: "Sepia", style: UIAlertActionStyle.Default) { (action) -> Void in
      self.imageView.image = FilterService.sepia(self.imageView.image!)
    }
    return action
  }
  
  private func filter2Action() -> UIAlertAction {
    let action = UIAlertAction(title: "Gaussian Blur", style: UIAlertActionStyle.Default) { (action) -> Void in
      self.imageView.image = FilterService.gaussianBlur(self.imageView.image!)
    }
    return action
  }
  
  private func filter3Action() -> UIAlertAction {
    let action = UIAlertAction(title: "Crystallize", style: UIAlertActionStyle.Default) { (action) -> Void in
      self.imageView.image = FilterService.crystallize(self.imageView.image!)
    }
    return action
  }
  
  private func cancelAction() -> UIAlertAction {
    let action = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
    return action
  }
  
  
}
