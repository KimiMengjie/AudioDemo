//
//  ViewController.swift
//  音乐播放
//
//  Created by kimi on 16/10/7.
//  Copyright © 2016年 kimi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    lazy var player:AVAudioPlayer? = {
        //1.创建播放器,只能是本地，远程无法播放,这个类只能播放一个
        let url = Bundle.main.url(forResource: "简单爱.mp3", withExtension: nil)!
        
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            
            //设置可以速率播放
            player.enableRate = true
            //准备播放
            player.prepareToPlay()
            
            //开始播放
            return player
        } catch  {
            print("error")
            return nil
        }
        
    }()
    
    
    @IBAction func play(_ sender: UIButton) {
        //调用音频会话
        playBack()
        
        player?.play()
    }
    
    @IBAction func pause(_ sender: UIButton) {
        player?.pause()
    }
    
    @IBAction func stop(_ sender: UIButton) {
        /*
         he stop method does not reset the value of the currentTime property to 0. In other words, if you call stop during playback and then call play(), playback resumes at the point where it left off.
         */
        //重置当前播放事件
        player?.currentTime = 0
        player?.stop()
    }
    
    @IBAction func kuaijin(_ sender: UIButton) {
        //这个值自动虎做好容错适配，不需要处理负数或者大于最大播放时长的数值
        player?.currentTime += 15
    }
    @IBAction func back(_ sender: UIButton) {
        player?.currentTime -= 15
    }
    @IBAction func multiplePlay(_ sender: UIButton) {
        player?.rate = 2.0
    }
    @IBAction func volumn(_ sender: UISlider) {
        player?.volume = sender.value
    }
    
    func playBack() -> Void {
        //1.获取音频会话
        let audioSession:AVAudioSession = AVAudioSession.sharedInstance()
        
        do {
            //2.设置会话类型
            try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            //3.激活会话
            try audioSession.setActive(true)
        } catch  {
            print(error)
        }
        

        

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        player?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// MARK: - 代理方法
extension ViewController:AVAudioPlayerDelegate{
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("播放完成");
    }
}

