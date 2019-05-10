//
//  BasicUsageController.swift
//  AssetsPickerViewController
//
//  Created by DragonCherry on 5/17/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import AssetsPickerViewController
import Photos

class BasicUsageController: CommonExampleController {
    
    override func pressedPick(_ sender: Any) {
        let config = AssetsPickerConfig()
        config.albumIsShowEmptyAlbum = false
        config.assetPortraitColumnCount = 3
        config.setupVideoFetchOptions()
        
        let picker = AssetsPickerViewController(pickerConfig: config)
        picker.pickerDelegate = self
        present(picker, animated: true, completion: nil)
    }
}

extension AssetsPickerConfig{
    func setupVideoFetchOptions(){
        let options = PHFetchOptions()
        options.includeHiddenAssets = albumIsShowHiddenAlbum
        options.sortDescriptors = [
            NSSortDescriptor(key: "creationDate", ascending: true),
            NSSortDescriptor(key: "modificationDate", ascending: true)
        ]
        options.predicate = NSPredicate(format: "mediaType = %i", PHAssetMediaType.video.rawValue)
        assetFetchOptions = [
            .smartAlbum: options,
            .album: options,
            .moment: options
        ]
    }
}
