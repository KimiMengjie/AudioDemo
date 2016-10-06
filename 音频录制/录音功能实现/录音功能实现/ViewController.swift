//
//  ViewController.swift
//  录音功能实现
//
//  Created by kimi on 16/10/6.
//  Copyright © 2016年 kimi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    lazy var record: AVAudioRecorder? = {
        
        //开始录音
        let url = NSURL(string: "/Users/kimi/Desktop/test.caf") as! URL
        
        //setting:录音的设置项
        //录音参数设置(不需要掌握，一些固定的配置)
        let configDic:[String: AnyObject] = [
            //编码格式
            AVFormatIDKey: NSNumber(integerLiteral: Int(kAudioFormatLinearPCM)),
            //采样率
            AVSampleRateKey: NSNumber(floatLiteral: 11025.0),
            //通道数
            AVNumberOfChannelsKey:NSNumber(integerLiteral: 2),
            //录音质量
            AVEncoderAudioQualityKey:NSNumber(integerLiteral: AVAudioQuality.min.rawValue)
        ]
        
        do {
            let record = try AVAudioRecorder(url: url, settings: configDic)
            //准备录音(系统会给我们分配一些资源)
            //直接开始录音(需要手动通过代码结束录音)
            record.prepareToRecord()
            
            return record
            //开始录音
//            record.record()
            //从未来的某个时间点，开始录音（需要我们手动通过代码结束录音）
            //            record.record(atTime: record.deviceCurrentTime + 3)
            
            //从现在开始录音，录多久
            //            record.record(forDuration: 3)
            
            //从哪个时间点开始录，录多久
            //            record.record(atTime: <#T##TimeInterval#>, forDuration: <#T##TimeInterval#>)
            
            
        } catch  {
            print(error)
            return nil
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //开始录音
        print("开始录音")
    
        record?.record()
        //指定录音3秒
//        record?.record(forDuration: 3)
//        record?.record(atTime: (record?.currentTime)! + 2, forDuration: 3)
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //结束录音
        //根据当前的录音时间，做处理
        //如果录音不超过两秒，则删除录音
        //如果超过，就正常处理
        if record!.currentTime > 2 {
            record?.stop()
        }else{
            print("录音时间太短")
            //删除录音
            //如果想要删除录音文件，必须先让录音文件停止
            //但是不进行编码的话4秒就900多KB
            record?.stop()
            record?.deleteRecording()
        }
        
        print("结束录音")
        record?.stop()
        
        //转码,转成功后删除源文件
        let path = lameTool.audio(toMP3: "/Users/kimi/Desktop/test.caf", isDeleteSourchFile: true)
        print(path)
    }


}

