//
//  CameraViewController.swift
//  xPose
//
//  Created by Xavier Welscher on 03.12.21.
//

import Photos
import PhotosUI
import UIKit

class CameraViewController: UIViewController, PHPickerViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Picker"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    @objc private func didTapAdd() {
//        let photos = PHPhotoLibrary.authorizationStatus()
//
//        if photos != .authorized {
//            PHPhotoLibrary.requestAuthorization({status in
//                if status != .authorized{
//                    self.dismiss(animated: true)
//                }
//            })
//        }
                
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = PHPickerFilter.any(of: [.images])
        config.preferredAssetRepresentationMode = .current
        config.selection = .ordered
        config.selectionLimit = 0
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        self.present(picker, animated: true)
        
    }
    
    private var images = [UIImage]()
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        return
    }

}
