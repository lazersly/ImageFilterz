//
//  FilterService.swift
//  ImageFilterz
//
//  Created by Brandon Roberts on 4/6/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

import UIKit
import CoreImage

class FilterService {
  
  private var context : CIContext
  
  init() {
    let contextOptions = [kCIContextWorkingColorSpace: NSNull()]
    let eglContext = EAGLContext(API: EAGLRenderingAPI.OpenGLES2)
    self.context = CIContext(EAGLContext: eglContext, options: contextOptions)
  }
  
  func sepia(originalImage : UIImage) -> UIImage? {
    let sepia = CIFilter(name: "CISepiaTone")
    return self.imageUsingFilter(originalImage, filter: sepia)
  }
  
  func gaussianBlur(originalImage : UIImage) -> UIImage? {
    let gaussian = CIFilter(name: "CIGaussianBlur")
    return self.imageUsingFilter(originalImage, filter: gaussian)
  }
  
  func crystallize(originalImage : UIImage) -> UIImage? {
    let crystallize = CIFilter(name: "CICrystallize")
    return self.imageUsingFilter(originalImage, filter: crystallize)
  }
  
  private func imageUsingFilter(originalImage: UIImage, filter: CIFilter) -> UIImage? {
    let newCIImage = CIImage(image: originalImage)
    filter.setValue(newCIImage, forKey: kCIInputImageKey)
    let filteredImageRef = filter.valueForKey(kCIOutputImageKey) as! CIImage
    let newCGImage = self.context.createCGImage(filteredImageRef, fromRect: filteredImageRef.extent())
    
    return UIImage(CGImage: newCGImage)
  }
}
