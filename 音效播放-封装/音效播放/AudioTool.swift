//
//  AudioTool.swift
//  音效播放
//
//  Created by kimi on 16/10/7.
//  Copyright © 2016年 kimi. All rights reserved.
//

import UIKit
import AVFoundation

class AudioTool: NSObject {
    
    class func playAudio(audioName:String, isAlert:Bool, completion:@escaping ()->()) {
        //1.获取音效文件对应的soundid
        //需要转换成CFURL类型
        guard let url = Bundle.main.url(forResource: audioName, withExtension: nil) else {
            return
        }
        
        let urlCF = url as CFURL
        
        //斗地主声音2
        guard let url2 = Bundle.main.url(forResource: audioName, withExtension: nil) else {
            return
        }
        
        let urlCF2 = url2 as CFURL
        
        //1.1创建 SystemSoundID
        var soundID:SystemSoundID = 0
        //1.2创建第二个声音的soundID
        var soundID2:SystemSoundID = 0
        
        
        AudioServicesCreateSystemSoundID(urlCF, &soundID)
        AudioServicesCreateSystemSoundID(urlCF2, &soundID2)
        
        if isAlert {
            AudioServicesPlaySystemSoundWithCompletion(soundID, { 
                //1.释放资源
                AudioServicesDisposeSystemSoundID(soundID)
                
                //2.告诉外界播放完成的事件
                completion()
            })
        }else{
            AudioServicesPlaySystemSoundWithCompletion(soundID, {
                //1.释放资源
                AudioServicesDisposeSystemSoundID(soundID)
                
                //2.告诉外界播放完成的事件
                completion()
            })
        }
        
        //2.根据soundID,播放音效
        //带振动播放
        //        AudioServicesPlayAlertSound(<#T##inSystemSoundID: SystemSoundID##SystemSoundID#>)
        
        //不带振动播放
        //        AudioServicesPlaySystemSound(soundID)
        
        //带播放完成的回调
//        AudioServicesPlaySystemSoundWithCompletion(soundID) {
//            print("播放完成")
//            //3.根据soundID,释放音效
//            AudioServicesDisposeSystemSoundID(soundID)
//            
//            AudioServicesPlaySystemSoundWithCompletion(soundID2, {
//                //3.1根据soundID2,释放音效
//                AudioServicesDisposeSystemSoundID(soundID2)
//            })
//        }
    }

}
