//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by David Gabrielyan on 17/10/18.
//  Copyright © 2018 David Gabrielyan. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    var audioRecorder: AVAudioRecorder!

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var startRecordingButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopRecordingButton.isEnabled = false;

    }

    @IBAction func recordAudio(_ sender: Any) {
        recordingLabel.text = "Recording in action"
        stopRecordingButton.isEnabled = true;
        startRecordingButton.isEnabled = false;
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "AudioRecordingPitchPerfect.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: .default)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [ : ])
        audioRecorder.delegate = self;
        audioRecorder.isMeteringEnabled = true;
        audioRecorder.prepareToRecord();
        audioRecorder.record();
        
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        recordingLabel.text = "Tap to record"
        stopRecordingButton.isEnabled = false;
        startRecordingButton.isEnabled = true;
        
        audioRecorder.stop();
        let audioSession = AVAudioSession.sharedInstance();
        try! audioSession.setActive(false);
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("recording wasn't successful");
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playSoundsVC = segue.destination as! PlaySoundsViewController;
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedSoundURL = recordedAudioURL
        }
    }
    
    @IBAction func collectionButton(_ sender: Any) {
        //print("Fuckkkkk")
        //performSegue(withIdentifier: "openCollectionView", sender: self)
    }
    
}

