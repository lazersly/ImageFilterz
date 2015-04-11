//
//  PhotoViewController.swift
//  ImageFilterz
//
//  Created by Brandon Roberts on 4/6/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UICollectionViewDataSource {
  
  //MARK: IB Outlets
  @IBOutlet var imageView: UIImageView! //Setting self.currentPhoto changes the viewed photo
  @IBOutlet var filteredCollection: UICollectionView!
  
  //MARK: Instance Variables
  let filterService = FilterService()
  var filters : [(UIImage) -> UIImage?]!
  var currentImage : UIImage? {
    didSet {
      self.imageView.image = currentImage
      //TODO: End editing?
    }
  }
  
  let alertController = UIAlertController(title: "Edit Photo", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)

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
    self.alertController.addAction(self.filterCollectionAction())
    self.alertController.addAction(self.cancelAction())
    
    self.filters = [self.filterService.sepia, self.filterService.gaussianBlur, self.filterService.crystallize]
    self.currentImage = UIImage(named: "Photo.jpg")
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
      self.currentImage = self.filterService.sepia(self.imageView.image!)
    }
    return action
  }
  
  private func filter2Action() -> UIAlertAction {
    let action = UIAlertAction(title: "Gaussian Blur", style: UIAlertActionStyle.Default) { (action) -> Void in
      self.currentImage = self.filterService.gaussianBlur(self.imageView.image!)
    }
    return action
  }
  
  private func filter3Action() -> UIAlertAction {
    let action = UIAlertAction(title: "Crystallize", style: UIAlertActionStyle.Default) { (action) -> Void in
      self.currentImage = self.filterService.crystallize(self.imageView.image!)
    }
    return action
  }
  
  private func filterCollectionAction() -> UIAlertAction {
    let action = UIAlertAction(title: "Multi-filter", style: UIAlertActionStyle.Default) { (action) -> Void in
      //TODO: Show the collection view and enter editing mode
    }
    return action
  }
  
  private func cancelAction() -> UIAlertAction {
    let action = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
    return action
  }
  
  //MARK: UICollectionViewDataSource
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.filters.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FilterCell", forIndexPath: indexPath) as! FilteredImageCollectionViewCell
    
    let filterFunction = self.filters[indexPath.row]
    cell.cellImageView.image = filterFunction(self.currentImage!)
    
    return cell
  }
  
  //MARK: UICollectionViewDelegate
  
  
}
