//
//  SDKHelpers.swift
//  Zype
//
//  Created by Eugene Lizhnyk on 10/21/15.
//  Copyright © 2015 Eugene Lizhnyk. All rights reserved.
//


import UIKit
import ZypeSDK

extension VideoModel {
  
  func thumbnailURL() -> NSURL? {
    if(self.thumbnails.count > 0){
      if let url = thumbnails.first?.imageURL {
        return NSURL(string: url)
      }
    }
    return nil
  }
  
  func posterURL() -> NSURL? {
    if let model = self.getThumbnailByHeight(1080) {
      return NSURL(string: model.imageURL)
    }
    return nil
  }
  
  func isInFavorites() -> Bool{
    let defaults = NSUserDefaults.standardUserDefaults()
    if let favorites = defaults.arrayForKey(Const.kFavoritesKey) as? Array<String> {
      return favorites.contains(self.ID)
    }
    return false
  }
  
  func toggleFavorite() {
    let defaults = NSUserDefaults.standardUserDefaults()
    var favorites = defaults.arrayForKey(Const.kFavoritesKey) as? Array<String> ?? [String]()
    if(self.isInFavorites()) {
      favorites.removeAtIndex(favorites.indexOf(self.ID)!)
    } else {
      favorites.append(self.ID)
    }
    defaults.setObject(favorites, forKey: Const.kFavoritesKey)
    defaults.synchronize()
  }
  
}
