//
//  XZMyPhotoManage.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/3.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

//MARK:--代理
protocol XZMyPhotoManageDelegate : class{
    func uploadImage(myImage:UIImage)
}

class XZMyPhotoManage : NSObject{
//MARK:--单例 （结构体变量嵌套）
    class var sharedPhotoManage : XZMyPhotoManage {
        struct  photoManage{
            static let sharedPhotoManage = XZMyPhotoManage()
        }
        return photoManage.sharedPhotoManage
    }
    
    //MARK:--属性
    var factherVC : UIViewController?
    var isCamera :  Bool?
    
    //MARK:--定义代理
    weak var delegate : XZMyPhotoManageDelegate?
    //MARK:--公开类方法，显示相机相册alert
    func showActionSheetInVC(factherVC : UIViewController,aDelegate:XZMyPhotoManageDelegate)  {
        self.delegate = aDelegate;
        self.factherVC = factherVC;
        
        weak var weakSelf = self
        let altVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet);
        let albumAction = UIAlertAction(title: "相册中选择", style: .`default`, handler: { (action : UIAlertAction) in
            weakSelf?.initPhotoPicker()
             
        })
            
        let cameraAction = UIAlertAction(title: "拍照", style: .default) { (action : UIAlertAction) in
            weakSelf?.initCameraPicker()
        }
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        altVC.addAction(albumAction)
        altVC.addAction(cameraAction)
        altVC.addAction(cancelAction)
        
        factherVC .present(altVC, animated: true, completion: nil)
        
    }
    
    //MARK:--直接调取相机
    
    //MARK:--直接调相册
    
}


//MARK:-- 相机相册代理
extension XZMyPhotoManage : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    //相册 选择
    func initPhotoPicker(){
        let photoPicker = UIImagePickerController()
        photoPicker.delegate = self;
        photoPicker.allowsEditing = true;
        photoPicker.sourceType = .photoLibrary
        self.factherVC?.present(photoPicker, animated: true, completion: nil)
        
    }
    
    //拍照
    func initCameraPicker(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            let camperPicker = UIImagePickerController()
            camperPicker.delegate = self;
            camperPicker.sourceType = .camera
            self.factherVC?.present(camperPicker, animated: true, completion: nil)
            
            
        }else{
            DDLog("设备不支持拍照")
        }
        
    }
    
    
    //系统相册相机代理方法
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //在这个方法里我们可以进行图片的修改, 保存, 或者视频的保存
        // UIImagePickerControllerOriginalImage 原始图片
        // UIImagePickerControllerEditedImage 编辑后图片
        // UIImagePickerControllerOriginalImage
        //获取照片
        let img : UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        if picker.sourceType == .camera {//是拍照
            //保存到相册
            UIImageWriteToSavedPhotosAlbum(img, self, #selector(image(image:didFinishSavingWithError:contextInfo:)), nil)
        }
        
        //把图片传回控制器
        self.delegate?.uploadImage(myImage: img);
        
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
    //保存到系统相册
    @objc func image(image:UIImage,didFinishSavingWithError error:NSError?,contextInfo:AnyObject) {
    
        if error != nil{
            DDLog("保存失败")
        }else{
            DDLog("保存成功")
        }
    
    }
}
















