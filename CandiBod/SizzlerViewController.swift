///
//  CandiBodViewController.swift
//  CandiBod
//
//  Created by Amanda Baret on 7/23/18.
//  Copyright © 2018 Amanda Baret. All rights reserved.
//

import UIKit
import AVFoundation

class CandiBodViewController: UIViewController ,  AVAudioPlayerDelegate
{
    static var instance:CandiBodViewController?
    
    @IBOutlet weak var BrightnessButton: UIButton!
    @IBOutlet weak var exerciseTitle: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet var WorkoutViewCollection: [WorkoutView]!
    @IBOutlet weak var workoutTitle: UILabel!
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var repeatCountLabel: UILabel!
    @IBOutlet weak var exerciseCountLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var CloseButton: UIButton!
    
   
    var textColor = UIColor.white
    
    var player: AVAudioPlayer?
    
    var workouts : [Workout] = []
    var currentExercise: Exercise!
    var workout: Workout!
    
    let manager = WorkoutDataSource()
    
    var timer = Timer()
    var exerciseCounter = 0
    var  three21Counter = 0
    var  exerciseTimerCounter = 0
    var isPaused = false
    var isDoing321Timer = false;
    var hasWorkoutBegun = false
    var isDimmed = false
    
    override func awakeFromNib()
    {
        type(of: self).instance = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.workouts = manager.getWorkOuts()
        self.startButton.layer.cornerRadius = startButton.bounds.width * 0.5
        self.startButton.layer.borderColor = textColor.cgColor
        self.startButton.layer.borderWidth = 2
        
        self.backButton.layer.cornerRadius = backButton.bounds.width * 0.5
        self.backButton.layer.borderColor = textColor.cgColor
        self.backButton.layer.borderWidth = 1
        
        self.forwardButton.layer.cornerRadius = forwardButton.bounds.width * 0.5
        self.forwardButton.layer.borderColor = textColor.cgColor
        self.forwardButton.layer.borderWidth = 1
        
        self.backButton.isHidden = true
        self.timerLabel.alpha = 0;
     
        self.CloseButton.isEnabled = false
        self.CloseButton.isHidden = true
       
        self.BrightnessButton.imageView?.setImageColor(color: textColor)
      }
    
    override func viewWillAppear(_ animated: Bool) {
        var i : Int
        i = 0;
         self.BrightnessButton.imageView?.setImageColor(color: textColor)
        
        for workoutView in WorkoutViewCollection{
            if(i == 0)
            {
                workoutView.Select()
            }
            workoutView.Index = i;
            i += 1
        }
        WorkoutSelected(index: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 1) {
            self.timerLabel.text  =  String(format:"%02i:%02i", 0, 0)
            self.timerLabel.alpha = 1
        }
     }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BrightnessClick(_ sender: Any) {
        UIScreen.main.brightness = self.isDimmed ? 1: 0.5;
        self.isDimmed = !self.isDimmed
    }
    
    @IBAction func CloseButtonClick(_ sender: Any) {
        self.isPaused = true
        self.timer.invalidate()
        self.startButton.setTitle("Start", for: .normal)
        let alert = UIAlertController(title: "Had enough?", message: "Stop " + self.workout.title, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.EndWorkout()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            self.Restart()
            self.CloseButton.isHidden = false
            self.CloseButton.isEnabled = true
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func startButton_Click(_ sender: Any)
    {
        if(!hasWorkoutBegun)
        {
            CloseButton.isEnabled = true
            CloseButton.isHidden = false
            startButton.setTitle("Pause", for: .normal)
            playSound(audioFile: self.workout.startAudio);
            return
        }
        if(!isPaused )
        {
            isPaused = true
            timer.invalidate()
            stopSound()
            startButton.setTitle("Start", for: .normal)
            return
        }
        
        startButton.setTitle("Pause", for: .normal)
        isPaused = false
        Restart()
    }
    
    @IBAction func backClick(_ sender: Any) {
        PageForwardOrdBack(workoutindex:-1);
    }
    
    @IBAction func forwardClick(_ sender: Any) {
        PageForwardOrdBack(workoutindex:1);
    }
    
    func PageForwardOrdBack(workoutindex: Int )
    {
        let nextWorkout = workout.index + workoutindex
        WorkoutSelected(index: nextWorkout)
    }
    
    func UpdateTime(timelimit: Int, timeleft: Int)
    {
        let timedone = CGFloat(timelimit - timeleft ) ;
        
        var timeDoneRatio = CGFloat(0);
        if(timelimit != 0 && timeleft == 0)
        {
            timeDoneRatio = 1
        }
        else if(timedone < CGFloat(timelimit))
        {
            timeDoneRatio = CGFloat(timedone/CGFloat(timelimit ))
        }
        (self.timerView as? TimerView)?.AnimateTime(timedoneratio: timeDoneRatio )
        
        setTime(time: timeleft)
    }
    
    func setTime(time: Int)
    {
        if(time == 0)
        {
            return
        }
          DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6) {
            let minutes = Int(time) / 60 % 60
            let sec = Int(time) % 60
            self.timerLabel.fadeTransition(0.4)
            self.timerLabel.text  =  String(format:"%02i:%02i", minutes, sec)
        }
    }
    
    func SetTimeNoDelay(time: Int)
    {
        let minutes = Int(time) / 60 % 60
        let sec = Int(time) % 60
        self.timerLabel.fadeTransition(0.4)
        self.timerLabel.text  =  String(format:"%02i:%02i", minutes, sec)
        
    }
    func RefreshCounterLabels(initialise: Bool = false)
    {
        self.exerciseCountLabel.fadeTransition(0.4)
        var parts = currentExercise.counter.split(separator: "/", maxSplits: 1, omittingEmptySubsequences: true)
        let totalExercises = initialise ? "0/" + parts[1] : String(currentExercise.counter)
        self.exerciseCountLabel.text = totalExercises
        self.repeatCountLabel.fadeTransition(0.4)
        self.repeatCountLabel.text = String(initialise ? 0 : currentExercise.roundCounter) + "/" + String(currentExercise.roundCount)
        self.exerciseTitle.fadeTransition(0.4)
        self.exerciseTitle.text = initialise ? "  " : self.currentExercise.title
    }
    
    func WorkoutSelected(index : Int)
    {
        hasWorkoutBegun = false;
        timer.invalidate()
        stopSound()
        exerciseCounter = 0;
        three21Counter = 0
        isDoing321Timer = false
        UpdateTime(timelimit: 0, timeleft: 0)
        SetTimeNoDelay(time: 0)
        startButton.setTitle("Start", for: .normal)
        self.backButton.isHidden = index == 0
        self.forwardButton.isHidden = index == 4
        CloseButton.isHidden = true
        CloseButton.isEnabled = false
        workout = self.workouts[index]
        workoutTitle.text = workout?.title
        
        currentExercise = workout.exercises[0]
        RefreshCounterLabels(initialise: true)
        
        for workoutView in WorkoutViewCollection{
            if(workoutView.Index == index)
            {
                workoutView.Select()
            }
            else
            {
                workoutView.UnSelect()
            }
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
          self.view.backgroundColor = self.workout.backgroundColor
        }, completion: { _ in
            
            // completion
        })
        
    }
    
    func EndWorkout()
    {
        stopSound()
        isPaused = false
        hasWorkoutBegun = false
        CloseButton.isEnabled = false
        CloseButton.isHidden = true
        exerciseCounter = 0
        exerciseTitle.fadeTransition(0.4)
        exerciseTitle.text = " "
        currentExercise = workout?.exercises[0]
        timer.invalidate()
        UpdateTime(timelimit: 0, timeleft: 0)
        SetTimeNoDelay(time: 0)
        RefreshCounterLabels(initialise: true)
        startButton.setTitle("Start", for: .normal)
    }
    
    fileprivate func Restart()
    {
       if(isDoing321Timer)
        {
            Do321Counter()
        }
        else
        {
            RunWorkout()
        }
    }
   
    fileprivate func Do321Counter() {
        isDoing321Timer = true
        three21Counter = 3;
        self.playSound(audioFile: "321Go");
        self.SetTimeNoDelay(time:  three21Counter)
        (self.timerView as? TimerView)?.AnimateTime(timedoneratio: 0 )
        self.timer =  Timer.scheduledTimer(withTimeInterval: 1, repeats: true)
        { _ in
            
            self.three21Counter -= 1
            self.SetTimeNoDelay(time:  self.three21Counter)
            if self.three21Counter == 1{
                self.timer.invalidate()
                self.isDoing321Timer = false
                self.fullTime = self.currentExercise.time
                self.timeleft = self.currentExercise.time
                self.RunWorkout()
            }
        }
    }
    
    var fullTime = 0
   var  timeleft = 0
   
    func RunWorkout()
    {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
           
            if(self.timeleft == 0)
            {
                self.UpdateTime(timelimit: self.fullTime, timeleft: self.timeleft)
                self.exerciseCounter += 1
                self.currentExercise = self.workout.exercises[self.exerciseCounter]
                self.timeleft = self.currentExercise.time
                self.fullTime = self.currentExercise.time
                self.setTime(time: self.fullTime)
                 self.timeleft -= 1
                return
                
            }
             self.RefreshCounterLabels()
            self.UpdateTime(timelimit: self.fullTime, timeleft:  self.timeleft )
            
            if(self.fullTime - self.timeleft == 2)
            {
                if(!(self.currentExercise.startaudio ?? "").isEmpty)
                {
                    self.playSound(audioFile: self.currentExercise.startaudio)
                }
            }
            if(!self.currentExercise.isBreak && self.timeleft == self.fullTime/2 - 1  )
            {
               self.playSound(audioFile: "you got this");
              
            }
            if(self.timeleft == 2)
            {
               self.playSound(audioFile: self.currentExercise.endAudio)
            }
         
              self.timeleft -= 1
        }
    }
    
    func playSound(audioFile: String) {
        guard let url = Bundle.main.url(forResource: audioFile, withExtension: "wav", subdirectory: "Audio") else
        {
            return
        }
        
        do {
           // try AVAudioSession.sharedInstance().category = AVAudioSession.Category.playback
           // try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            //guard let player = player else { return }
            player?.delegate = self
            player!.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stopSound() {
        
        self.player?.stop()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        if(!hasWorkoutBegun )
        {
            hasWorkoutBegun = true
            Do321Counter()
        }
    }
    
    func showErrorAlert(VC vc : UIViewController, OKTitle okTitle : String, CancelTitle cancelTitle : String, Message message : String, Title title : String) -> Void {
        
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert
        )
        
        let cancelAction = UIAlertAction(
            title: cancelTitle,
            style: UIAlertAction.Style.destructive) { (action) in
                NotificationCenter.default.post(name: Notification.Name("CancelClicked"), object: nil)
        }
        
        let confirmAction = UIAlertAction(
        title: okTitle, style: UIAlertAction.Style.default) { (action) in
            NotificationCenter.default.post(name: Notification.Name("OKClicked"), object: nil)
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        vc.present(alertController, animated: true, completion: nil)
    }
}
