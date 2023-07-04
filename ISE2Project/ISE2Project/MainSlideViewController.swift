//
//  MainSlideViewController.swift
//  ISE2Project
//
//  Created by AL19 on 03/07/23.
//

import UIKit
import AVFoundation
import AVKit
class MainSlideViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let videoURL = Bundle.main.url(forResource: "Sample", withExtension: "mp4") {
            let player = AVPlayer(url: videoURL)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = view.bounds
            view.layer.addSublayer(playerLayer)
            player.play()
        } else {
            print("Video file not found.")
        }
    }

//    func PlayVideo()
//   {
//       let videoURL = URL(string: //"http://techslides.com/demos/sample-videos/small.mp4")
//
//           // Create an AVPlayer with the video URL
//           let player = AVPlayer(url: videoURL!)
//
//           // Create an AVPlayerLayer to display the video
//           let playerLayer = AVPlayerLayer(player: player)
//           playerLayer.frame = self.view.bounds
//           playerLayer.videoGravity = .resizeAspect
//
//           // Add the playerLayer to your view's layer
//           self.view.layer.addSublayer(playerLayer)
//
//
//           player.play()
//   }
//

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
