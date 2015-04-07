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
  class func sepia(originalImage : UIImage) -> UIImage? {
    let sepia = CIFilter(name: "CISepiaTone")
    sepia.setDefaults()
//    let keys = [kciinpu]
    return nil
  }
  
  class func gaussianBlur(originalImage : UIImage) -> UIImage? {
    return nil
  }
  
  class func crystallize(originalImage : UIImage) -> UIImage? {
    return nil
  }
}
