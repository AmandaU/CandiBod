///
//  CandiBodViewController.swift
//  CandiBod
//
//  Created by Amanda Baret on 7/23/18.
//  Copyright © 2018 Amanda Baret. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
import AudioToolbox

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
     var hasWorkoutEnded = false
    var isDoingIntro = false
    var isDimmed = false
    var playImage = UIImage(named: "Play")
    var pauseImage = UIImage(named: "Pause")
    
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
        self.navigationController?.setNavigationBarHidden( true, animated: false)
       
        self.workouts = manager.getWorkOuts()
        
        self.backButton.isHidden = true
        self.timerLabel.alpha = 0;
     
        self.CloseButton.isEnabled = false
        self.CloseButton.isHidden = true
        
        playImage?.accessibilityIdentifier = "Play"
        pauseImage?.accessibilityIdentifier = "Pause"
       
        registerForNotifications()
      }
    
    override func viewWillAppear(_ animated: Bool) {
        var i : Int
        i = 0;

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
        
        let alert = UIAlertController(title: "Had enough?", message: "Stop " + self.workout.title, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
             self.hasWorkoutEnded = false
            self.EndWorkout()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            self.Restart()
            self.CloseButton.isHidden = false
            self.CloseButton.isEnabled = true
            self.startButton.setBackgroundImage(self.pauseImage, for: .normal)
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func startButton_Click(_ sender: Any)
    {
        let img = startButton.backgroundImage(for: .normal)
        if(img?.accessibilityIdentifier == "Play")
        {
            if(hasWorkoutBegun && !isDoingIntro)
            {
                self.startButton.setBackgroundImage(self.pauseImage, for: .normal)
                isPaused = false
                Restart()
            }
            else
            {
                isDoingIntro = true
                isPaused = false
                CloseButton.isEnabled = true
                CloseButton.isHidden = false
                self.startButton.setBackgroundImage(self.pauseImage, for: .normal)
                playSound(audioFile: self.workout.startAudio);
            }
        }
        else
        {
            isPaused = true
            timer.invalidate()
            stopSound()
            self.startButton.setBackgroundImage(self.playImage, for: .normal)
        }
        
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
        
        let minutes = Int(time) / 60 % 60
        let sec = Int(time) % 60
        self.timerLabel.fadeTransition(0.4)
        self.timerLabel.text  =  String(format:"%02i:%02i", minutes, sec)
        /*
          DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6) {
            let minutes = Int(time) / 60 % 60
            let sec = Int(time) % 60
            self.timerLabel.fadeTransition(0.4)
            self.timerLabel.text  =  String(format:"%02i:%02i", minutes, sec)
        }
 */
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
        self.startButton.setBackgroundImage(playImage, for: .normal)
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
           
        })
    }
    
    func EndWorkout()
    {
       timer.invalidate()
        stopSound()
        isPaused = false
        hasWorkoutBegun = false
        isDoingIntro = false
        CloseButton.isEnabled = false
        CloseButton.isHidden = true
        exerciseCounter = 0
        exerciseTitle.fadeTransition(0.4)
        exerciseTitle.text = " "
        currentExercise = workout?.exercises[0]
        UpdateTime(timelimit: 0, timeleft: 0)
        SetTimeNoDelay(time: 0)
        RefreshCounterLabels(initialise: true)
        startButton.setBackgroundImage(playImage, for: .normal)
    }
    
    fileprivate func Restart()
    {
       if(isDoing321Timer)
        {
            Do321Counter()
        }
        else
        {
            hasWorkoutEnded = false
            RunWorkout()
        }
    }
   
    fileprivate func Do321Counter() {
        isDoing321Timer = true
        three21Counter = 3;
        
        if(!(self.workout.endAudio ?? "").isEmpty)
        {
            self.playSound(audioFile: self.workout.endAudio)
        }
        
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
                self.isDoingIntro = false
                self.RunWorkout()
            }
        }
    }
    
    var fullTime = 0
   var  timeleft = 0
   
    func RunWorkout()
    {
        var  bgRideTimerTask = UIBackgroundTaskIdentifier.invalid;
      
        bgRideTimerTask = UIApplication.shared.beginBackgroundTask()
        
       self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
          
            if(self.timeleft == 0)
            {
                self.UpdateTime(timelimit: self.fullTime, timeleft: self.timeleft)
                self.exerciseCounter += 1
                 if(self.exerciseCounter == self.workout.exercises.count )
                 {
                     self.hasWorkoutEnded = true
                    self.EndWorkout()
                     self.playSound(audioFile: "WorkoutComplete");
                    return
                }
                 if(self.exerciseCounter > self.workout.exercises.count )
                 {
                return
                }
                
                self.currentExercise = self.workout.exercises[self.exerciseCounter]
                
                self.timeleft = self.currentExercise.time
                self.fullTime = self.currentExercise.time
                self.setTime(time: self.fullTime)
                 self.timeleft -= 1
                return
                
            }
             self.RefreshCounterLabels()
            self.UpdateTime(timelimit: self.fullTime, timeleft:  self.timeleft )
            
            if(self.fullTime - self.timeleft == 1)
            {
                if(!(self.currentExercise.startaudio ?? "").isEmpty)
                {
                    self.playSound(audioFile: self.currentExercise.startaudio)
                }
            }
            if(!self.currentExercise.isBreak && self.timeleft == self.fullTime/2 - 1  )
            {
               self.playSound(audioFile: "yougotthis");
              
            }
            if(self.timeleft == 3)
            {
                if(!(self.currentExercise.endAudio ?? "").isEmpty)
                {
                    self.playSound(audioFile: self.currentExercise.endAudio)
                }
            }
         
              self.timeleft -= 1
        }
        
        RunLoop.current.add( timer , forMode: RunLoop.Mode.tracking);
    }
    
    func playSound(audioFile: String) {
        
        /*
        let path = Bundle.main.path(forResource: audioFile, ofType: "wav",inDirectory: "Audio")
        let url = URL(fileURLWithPath: path ?? "")
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
 */
        
        guard let url = Bundle.main.url(forResource: audioFile, withExtension: "wav", subdirectory: "Audio") else
        {
            return
        }
        
        do
        {
           let session = AVAudioSession.sharedInstance()
            
            try!session.setCategory(AVAudioSession.Category.playback, mode: .default, options: [.duckOthers])
           //try session.setCategory(AVAudioSession.Category.ambient,  mode: .default,  options: [])
            //try session.setCategory(.playback, mode: .default,  policy: .longForm, options: [.mixWithOthers, .allowAirPlay])
            
           //try session.setCategory(.playback, mode: .default,  policy: .default, options: [.mixWithOthers, .allowAirPlay])
            print("Playback OK")
            try session.setActive(true)
           
            
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
        self.isDoingIntro = false
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        /*
        do {
            try AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
        } catch {
            print ("setActive(false) ERROR : \(error)")
        }
 */
        
        if(self.hasWorkoutEnded)
        {
            self.hasWorkoutEnded = false
            return
        }
        if(self.hasWorkoutBegun)
        {
            return
        }
        if(self.isPaused)
        {
            return
        }
       
        self.hasWorkoutBegun = true
        self.Do321Counter()
       
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
    
    func registerForNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleInterruption),
                                               name: AVAudioSession.interruptionNotification,
                                               object: AVAudioSession.sharedInstance())
    }
    
    @objc func handleInterruption(_ notification: Notification) {
        guard let info = notification.userInfo,
            let typeValue = info[AVAudioSessionInterruptionTypeKey] as? UInt,
            let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
                return
        }
        if type == .began {
            isPaused = true
            timer.invalidate()
           
        }
        else if type == .ended {
            self.Restart()
           
        }
    }
}
