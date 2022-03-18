//
//  ViewController.swift
//  DVProgressLabel
//
//  Created by anjaeyoung26 on 03/18/2022.
//  Copyright (c) 2022 anjaeyoung26. All rights reserved.
//

import DVProgressLabel
import UIKit

class ViewController: UIViewController {
  private let progressLabel = DVProgressLabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setprogressLabel()
    setConstraints()
    updateProgress()
  }
  
  private func setprogressLabel() {
    progressLabel.translatesAutoresizingMaskIntoConstraints = false
    progressLabel.font = .boldSystemFont(ofSize: 20)
    progressLabel.text = "Progress"
    progressLabel.textAlignment = .center
    progressLabel.textColor = .gray
    
    view.addSubview(progressLabel)
  }
  
  private func setConstraints() {
    progressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
    progressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    progressLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    progressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }
  
  private func updateProgress() {
    var progress: CGFloat = 0
    
    _ = Timer.scheduledTimer(
      withTimeInterval: 0.01,
      repeats: true,
      block: { timer in
        progress += 0.01
        
        if progress >= 1.0 {
          timer.invalidate()
        }
        
        self.progressLabel.update(progress: progress)
      })
  }
}

