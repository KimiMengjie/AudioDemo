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
        let url = NSURL(string: "/Users/kimi/Desktop/audio/test.caf") as! URL
        
        //setting:录音的设置项
        let configDic = ["":""]
        
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
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //结束录音
        record?.stop()
    }


}

