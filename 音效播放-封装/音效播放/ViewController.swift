//
//  ViewController.swift
//  音效播放
//
//  Created by kimi on 16/10/6.
//  Copyright © 2016年 kimi. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //添加到操作队列
        let group =  DispatchGroup()
        
        group.enter()
        AudioTool.playAudio(audioName: "m_17.wav", isAlert: true) { 
//            print("播放完成");
            AudioTool.playAudio(audioName: "win.aac", isAlert: true) {
                //                print("播放完成");
            }
            group.leave()
        }
        group.notify(queue: DispatchQueue.main) {

            print("播放完成")
        }
    }

}

