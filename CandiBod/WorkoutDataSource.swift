//
//  WorkoutDatasource.swift
//  CandiBod
//
//  Created by Amanda Baret on 9/30/18.
//  Copyright © 2018 Amanda Baret. All rights reserved.
//

import Foundation
import UIKit

class Workout {
    
   var exercises:[Exercise]!
    var title: String!
    var startAudio: String!
    var endAudio: String!
    var index: Int
    var exerciseCount: Int
    var backgroundColor = UIColor()
  
   
    init(index: Int, title: String, startAudio: String,  endAudio: String,  exercises:[Exercise]!, exerciseCount: Int, backgroundColor: UIColor){
        
        self.title = title
        self.exercises = exercises
        self.startAudio = startAudio
        self.endAudio = endAudio
        self.index = index
        self.exerciseCount = exerciseCount
        self.backgroundColor = backgroundColor
    }
}

class Exercise {
    var title: String!
    var time: Int!
    var startaudio: String!
    var endAudio: String!
    var roundCount: Int!
    var roundCounter: Int!
    var isBreak = false
    var counter: String!
    
    init(counter: String!, title: String!, roundCount: Int, roundCounter: Int, time: Int ,  startaudio: String, endaudio: String,  isBreak: Bool = false  ){
       
        self.title = title
        self.time = time
        self.startaudio = startaudio
        self.endAudio = endaudio
        self.roundCount = roundCount
        self.roundCounter = roundCounter
        self.counter = counter
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
       let copy = Exercise(counter: counter, title: title, roundCount: roundCount, roundCounter: roundCounter, time: time, startaudio: startaudio, endaudio: endAudio)
        return copy
    }
 }

class WorkoutDataSource{
    
    var blue = UIColor(red: 0 , green: 0.188, blue: 0.329, alpha: 1.00)//hex(0,48,84)
    var gold = UIColor(red: 0.839 , green: 0.729, blue: 0.451, alpha: 1.00)//hex(214,186,115)
    var teal = UIColor(red: 0.003 , green: 0.529, blue: 0.553, alpha: 1.00)//hex(1,135,141)
    var seagreen = UIColor(red: 0.352 , green: 0.588, blue: 0.533, alpha: 1.00)//hex(90,150,136)
    var lilac = UIColor(red: 0.694 , green: 0.568, blue: 0.662, alpha: 1.00)//hex(177,145,169)
     var cream = UIColor(red: 0.992 , green: 0.918, blue: 0.859, alpha: 1.00)//hex(253,234,219)
    
    var workouts:[Workout]
   
    var W1C1Exercises:[Exercise]
    
    var W2C1Exercises:[Exercise]
    var W2C2Exercises:[Exercise]
    var W2C3Exercises:[Exercise]
    var W2C4Exercises:[Exercise]
    var W2C5Exercises:[Exercise]
    
    var W3C1Exercises:[Exercise]
    
    var W4C1Exercises:[Exercise]
    
    var W5C1Exercises:[Exercise]
    var W5C2Exercises:[Exercise]
    var W5C3Exercises:[Exercise]
    var W5C4Exercises:[Exercise]
    
    init() {
        workouts = []
        
        W1C1Exercises = []
        W2C1Exercises = []
        W2C2Exercises = []
        W2C3Exercises = []
        W2C4Exercises = []
        W2C5Exercises = []
        W3C1Exercises = []
        W4C1Exercises = []
        W5C1Exercises = []
        W5C2Exercises = []
        W5C3Exercises = []
        W5C4Exercises = []
        
        //1
        
        //Exercises
        let W1C1Exercise1 = Exercise(counter: "1/15", title: "", roundCount: 2, roundCounter: 1,time: 60, startaudio: "", endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise1)
        let W1C1Exercise2 = Exercise(counter: "2/15",title: "", roundCount: 2, roundCounter: 1,time: 60, startaudio: "", endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise2)
        let W1C1Exercise3 = Exercise(counter: "3/15",title: "", roundCount: 2, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise3)
        let W1C1Exercise4 = Exercise(counter: "4/15",title: "", roundCount: 2, roundCounter: 1,time: 60, startaudio: "", endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise4)
        let W1C1Exercise5 = Exercise(counter: "5/15",title: "", roundCount: 2, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise5)
        let W1C1Exercise6 = Exercise(counter: "6/15",title: "", roundCount: 2, roundCounter: 1,time: 60, startaudio: "", endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise6)
        let W1C1Exercise7 = Exercise(counter: "7/15",title: "", roundCount: 2, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise7)
        let W1C1Exercise8 = Exercise(counter: "8/15",title: "", roundCount: 2, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise8)
        let W1C1Exercise9 = Exercise(counter: "9/15",title: "", roundCount: 2, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise9)
        let W1C1Exercise10 = Exercise(counter: "10/15",title: "", roundCount: 2, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise10)
        let W1C1Exercise11 = Exercise(counter: "11/15",title: "", roundCount: 2, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise11)
        let W1C1Exercise12 = Exercise(counter: "12/15",title: "", roundCount: 2, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise12)
        let W1C1Exercise13 = Exercise(counter: "13/15",title: "", roundCount: 2, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise13)
        let W1C1Exercise14 = Exercise(counter: "14/15",title: "", roundCount: 2, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise14)
        let W1C1Exercise15 = Exercise(counter: "15/15",title: "", roundCount: 2, roundCounter: 1,time: 60, startaudio: "LastExercise",  endaudio: "1minBreak")
        W1C1Exercises.append(W1C1Exercise15)
        
        let W1Break = Exercise(counter: "15/15",title: "", roundCount: 2, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go", isBreak: true)
        W1C1Exercises.append(W1Break)
        
        
        let W1C1Exercise16 = Exercise(counter: "1/15",title: "", roundCount: 2, roundCounter: 2,time: 60, startaudio: "", endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise16)
        let W1C1Exercise17 = Exercise(counter: "2/15",title: "", roundCount: 2, roundCounter: 2,time: 60, startaudio: "", endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise17)
        let W1C1Exercise18 = Exercise(counter: "3/15",title: "", roundCount: 2, roundCounter: 2,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise18)
        let W1C1Exercise19 = Exercise(counter: "4/15",title: "", roundCount: 2, roundCounter: 2,time: 60, startaudio: "", endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise19)
        let W1C1Exercise20 = Exercise(counter: "5/15",title: "", roundCount: 2, roundCounter: 2,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise20)
      let W1C1Exercise21 = Exercise(counter: "6/15",title: "", roundCount: 2, roundCounter: 2,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise21)
        let W1C1Exercise22 = Exercise(counter: "7/15",title: "", roundCount: 2, roundCounter: 2,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise22)
        let W1C1Exercise23 = Exercise(counter: "8/15",title: "", roundCount: 2, roundCounter: 2,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise23)
        let W1C1Exercise24 = Exercise(counter: "9/15",title: "", roundCount: 2, roundCounter: 2,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise24)
        let W1C1Exercise25 = Exercise(counter: "10/15",title: "", roundCount: 2, roundCounter: 2,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise25)
        let W1C1Exercise26 = Exercise(counter: "11/15",title: "", roundCount: 2, roundCounter: 2,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise26)
        let W1C1Exercise27 = Exercise(counter: "12/15",title: "", roundCount: 2, roundCounter: 2,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise27)
        let W1C1Exercise28 = Exercise(counter: "13/15",title: "", roundCount: 2, roundCounter: 2,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise28)
        let W1C1Exercise29 = Exercise(counter: "14/15",title: "", roundCount: 2, roundCounter: 2,time: 60, startaudio: "",  endaudio: "321Go")
        W1C1Exercises.append(W1C1Exercise29)
        let W1C1Exercise30 = Exercise(counter: "15/15",title: "", roundCount: 2, roundCounter: 2,time: 60, startaudio: "LastExercise",  endaudio: "1minBreak")
        W1C1Exercises.append(W1C1Exercise30)
        
       
        //Workout
        let W1 = Workout(index: 0, title: "Sweat Sesh", startAudio: "SweatSeshWelcome", endAudio: "WorkoutComplete", exercises: W1C1Exercises, exerciseCount: 15, backgroundColor: lilac )
        
        //w2
        
        //Exercise
        
        let W2C1Exercise1 = Exercise(counter: "1/2", title: "Circuit 1", roundCount: 3, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W2C1Exercises.append(W2C1Exercise1)
        let W2C1Exercise2 = Exercise(counter: "2/2",title: "Circuit 1", roundCount: 3, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W2C1Exercises.append(W2C1Exercise2)
        let W2C1Exercise3 = Exercise(counter: "1/2",title: "Circuit 1", roundCount: 3, roundCounter: 2,time: 60, startaudio: "",  endaudio: "321Go")
        W2C1Exercises.append(W2C1Exercise3)
        let W2C1Exercise4 = Exercise(counter: "2/2",title: "Circuit 1", roundCount: 3, roundCounter: 2,time: 60, startaudio: "",  endaudio: "321Go")
        W2C1Exercises.append(W2C1Exercise4)
        let W2C1Exercise5 = Exercise(counter: "1/2",title: "Circuit 1", roundCount: 3, roundCounter: 3,time: 60, startaudio: "",  endaudio: "321Go")
        W2C1Exercises.append(W2C1Exercise5)
        let W2C1Exercise6 = Exercise(counter: "2/2",title: "Circuit 1", roundCount: 3, roundCounter: 3,time: 60, startaudio: "LastExercise",  endaudio: "45sBreak")
        W2C1Exercises.append(W2C1Exercise6)
        let W2Break = Exercise(counter: "1/2", title: "Take a break", roundCount: 3, roundCounter: 3,time: 45, startaudio: "",  endaudio: "321Go", isBreak: true)
        W1C1Exercises.append(W2Break)
        
        let W2C2Exercise1 = W2C1Exercise1.copy() as! Exercise
        W2C2Exercise1.title = "Circuit 2"
        W2C1Exercises.append(W2C2Exercise1)
        let W2C2Exercise2 = W2C1Exercise2.copy() as! Exercise
        W2C2Exercise2.title = "Circuit 2"
         W2C1Exercises.append(W2C2Exercise2)
        let W2C2Exercise3 = W2C1Exercise3.copy() as! Exercise
        W2C2Exercise3.title = "Circuit 2"
         W2C1Exercises.append(W2C2Exercise3)
        let W2C2Exercise4 = W2C1Exercise4.copy() as! Exercise
        W2C2Exercise4.title = "Circuit 2"
         W2C1Exercises.append(W2C2Exercise4)
        let W2C2Exercise5 = W2C1Exercise5.copy() as! Exercise
        W2C2Exercise5.title = "Circuit 2"
         W2C1Exercises.append(W2C2Exercise5)
        let W2C2Exercise6 = W2C1Exercise6.copy() as! Exercise
        W2C2Exercise6.title = "Circuit 2"
         W2C1Exercises.append(W2C2Exercise6)
         W1C1Exercises.append(W2Break)
        
        let W2C3Exercise1 = W2C1Exercise1.copy() as! Exercise
        W2C3Exercise1.title = "Circuit 3"
        W2C1Exercises.append(W2C3Exercise1)
        let W2C3Exercise2 = W2C1Exercise2.copy() as! Exercise
        W2C3Exercise2.title = "Circuit 3"
        W2C1Exercises.append(W2C3Exercise2)
        let W2C3Exercise3 = W2C1Exercise3.copy() as! Exercise
        W2C3Exercise3.title = "Circuit 3"
        W2C1Exercises.append(W2C3Exercise3)
        let W2C3Exercise4 = W2C1Exercise4.copy() as! Exercise
        W2C3Exercise4.title = "Circuit 3"
        W2C1Exercises.append(W2C3Exercise4)
        let W2C3Exercise5 = W2C1Exercise5.copy() as! Exercise
        W2C3Exercise5.title = "Circuit 3"
        W2C1Exercises.append(W2C3Exercise5)
        let W2C3Exercise6 = W2C1Exercise6.copy() as! Exercise
        W2C3Exercise6.title = "Circuit 3"
        W2C1Exercises.append(W2C3Exercise6)
         W1C1Exercises.append(W2Break)
        
        let W2C4Exercise1 = W2C1Exercise1.copy() as! Exercise
        W2C4Exercise1.title = "Circuit 4"
        W2C1Exercises.append(W2C4Exercise1)
        let W2C4Exercise2 = W2C1Exercise2.copy() as! Exercise
        W2C4Exercise2.title = "Circuit 4"
        W2C1Exercises.append(W2C4Exercise2)
        let W2C4Exercise3 = W2C1Exercise3.copy() as! Exercise
        W2C4Exercise3.title = "Circuit 4"
        W2C1Exercises.append(W2C4Exercise3)
        let W2C4Exercise4 = W2C1Exercise4.copy() as! Exercise
        W2C4Exercise4.title = "Circuit 4"
        W2C1Exercises.append(W2C4Exercise4)
        let W2C4Exercise5 = W2C1Exercise5.copy() as! Exercise
        W2C4Exercise5.title = "Circuit 4"
        W2C1Exercises.append(W2C4Exercise5)
        let W2C4Exercise6 = W2C1Exercise6.copy() as! Exercise
        W2C4Exercise6.title = "Circuit 4"
        W2C1Exercises.append(W2C4Exercise6)
        W1C1Exercises.append(W2Break)
        
        let W2C5Exercise1 = W2C1Exercise1.copy() as! Exercise
        W2C5Exercise1.title = "Circuit 5"
        W2C1Exercises.append(W2C5Exercise1)
        let W2C5Exercise2 = W2C1Exercise2.copy() as! Exercise
        W2C5Exercise2.title = "Circuit 5"
        W2C1Exercises.append(W2C5Exercise2)
        let W2C5Exercise3 = W2C1Exercise3.copy() as! Exercise
        W2C5Exercise3.title = "Circuit 5"
        W2C1Exercises.append(W2C5Exercise3)
        let W2C5Exercise4 = W2C1Exercise4.copy() as! Exercise
        W2C5Exercise4.title = "Circuit 5"
        W2C1Exercises.append(W2C5Exercise4)
        let W2C5Exercise5 = W2C1Exercise5.copy() as! Exercise
        W2C5Exercise5.title = "Circuit 5"
        W2C1Exercises.append(W2C5Exercise5)
        let W2C5Exercise6 = W2C1Exercise6.copy() as! Exercise
        W2C5Exercise6.title = "Circuit 5"
        W2C1Exercises.append(W2C5Exercise6)
        W1C1Exercises.append(W2Break)
     
        //Workouts
        let W2 = Workout(index: 1, title: "Bod Burner", startAudio: "BodBurnerWelcome", endAudio: "WorkoutComplete", exercises:W2C1Exercises, exerciseCount: 2 , backgroundColor: seagreen )
      
        //3
        
        //Exercises
        let W3C1Exercise1 = Exercise(counter: "1/10", title: "", roundCount: 1, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W3C1Exercises.append(W3C1Exercise1)
        let W3C1Exercise2 = Exercise(counter: "2/10",title: "", roundCount: 1, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W3C1Exercises.append(W3C1Exercise2)
        let W3C1Exercise3 = Exercise(counter: "3/10",title: "", roundCount: 1, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W3C1Exercises.append(W3C1Exercise3)
        let W3C1Exercise4 = Exercise(counter: "4/10",title: "", roundCount: 1, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W3C1Exercises.append(W3C1Exercise4)
        let W3C1Exercise5 = Exercise(counter: "5/10",title: "", roundCount: 1, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W3C1Exercises.append(W3C1Exercise5)
        let W3C1Exercise6 = Exercise(counter: "6/10",title: "", roundCount: 1, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W3C1Exercises.append(W3C1Exercise6)
        let W3C1Exercise7 = Exercise(counter: "7/10",title: "", roundCount: 1, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W3C1Exercises.append(W3C1Exercise7)
        let W3C1Exercise8 = Exercise(counter: "8/10",title: "", roundCount: 1, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W3C1Exercises.append(W3C1Exercise8)
        let W3C1Exercise9 = Exercise(counter: "9/10",title: "", roundCount: 1, roundCounter: 1,time: 60, startaudio: "",  endaudio: "321Go")
        W3C1Exercises.append(W3C1Exercise9)
        let W3C1Exercise10 = Exercise(counter: "10/10",title: "", roundCount: 1, roundCounter: 1,time: 60, startaudio: "LastExercise",  endaudio: "")
        W3C1Exercises.append(W3C1Exercise10)
        
        //workouts
        let W3 = Workout(index: 2, title: "Personal Challenge", startAudio: "PersonalChallengeWelcome", endAudio: "WorkoutComplete", exercises: W3C1Exercises,  exerciseCount: 10 , backgroundColor: gold )
        
        //4
        
        //Exercise
        let W4C1Exercise1 = Exercise(counter: "1/7",title: "", roundCount: 4, roundCounter: 1,time: 30, startaudio: "",  endaudio: "10sBreak")
        W4C1Exercises.append(W4C1Exercise1)
        let W4Break1 = Exercise(counter: "1/7",title: "", roundCount: 4, roundCounter: 1,time: 10, startaudio: "",  endaudio: "321Go", isBreak: true)
        W4C1Exercises.append(W4Break1)
        let W4C1Exercise2 = Exercise(counter: "2/7",title: "", roundCount: 4, roundCounter: 1,time: 30, startaudio: "",  endaudio: "10sBreak")
        W4C1Exercises.append(W4C1Exercise2)
        let W4Break2 = Exercise(counter: "2/7",title: "", roundCount: 4, roundCounter: 1,time: 10, startaudio: "",  endaudio: "321Go", isBreak: true)
        W4C1Exercises.append(W4Break2)
        let W4C1Exercise3 = Exercise(counter: "3/7",title: "", roundCount: 4, roundCounter: 1,time: 30, startaudio: "",  endaudio: "10sBreak")
        W4C1Exercises.append(W4C1Exercise3)
        let W4Break3 = Exercise(counter: "3/7",title: "", roundCount: 4, roundCounter: 1,time: 10, startaudio: "",  endaudio: "321Go", isBreak: true)
        W4C1Exercises.append(W4Break3)
        let W4C1Exercise4 = Exercise(counter: "4/7",title: "", roundCount: 4, roundCounter: 1,time: 30, startaudio: "",  endaudio: "10sBreak")
        W4C1Exercises.append(W4C1Exercise4)
        let W4Break4 = Exercise(counter: "4/7",title: "", roundCount: 4, roundCounter: 1,time: 10, startaudio: "",  endaudio: "321Go", isBreak: true)
        W4C1Exercises.append(W4Break4)
        let W4C1Exercise5 = Exercise(counter: "5/7",title: "", roundCount: 4, roundCounter: 1,time: 30, startaudio: "",  endaudio: "10sBreak")
        W4C1Exercises.append(W4C1Exercise5)
        let W4Break5 = Exercise(counter: "5/7",title: "", roundCount: 4, roundCounter: 1,time: 10, startaudio: "",  endaudio: "321Go", isBreak: true)
        W4C1Exercises.append(W4Break5)
        let W4C1Exercise6 = Exercise(counter: "6/7",title: "", roundCount: 4, roundCounter: 1,time: 30, startaudio: "",  endaudio: "10sBreak")
        W4C1Exercises.append(W4C1Exercise6)
        let W4Break6 = Exercise(counter: "6/7",title: "", roundCount: 4, roundCounter: 1,time: 10, startaudio: "",  endaudio: "321Go", isBreak: true)
        W4C1Exercises.append(W4Break6)
        let W4C1Exercise7 = Exercise(counter: "7/7",title: "", roundCount: 4, roundCounter: 1,time: 30, startaudio: "LastExercise",  endaudio: "45sBreak")
        W4C1Exercises.append(W4C1Exercise7)
        let W4Break7 = Exercise(counter: "7/7",title: "", roundCount: 4, roundCounter: 1,time: 10, startaudio: "",  endaudio: "321Go", isBreak: true)
        W4C1Exercises.append(W4Break7)
        
        
          W4C1Exercises.append(W4C1Exercise1)
         W4C1Exercises.append(W4Break1)
        W4C1Exercises.append(W4C1Exercise2)
        W4C1Exercises.append(W4Break2)
        W4C1Exercises.append(W4C1Exercise3)
        W4C1Exercises.append(W4Break3)
        W4C1Exercises.append(W4C1Exercise4)
        W4C1Exercises.append(W4Break4)
        W4C1Exercises.append(W4C1Exercise5)
        W4C1Exercises.append(W4Break5)
        W4C1Exercises.append(W4C1Exercise6)
        W4C1Exercises.append(W4Break6)
        W4C1Exercises.append(W4C1Exercise7)
        W4C1Exercises.append(W4Break7)
        
        W4C1Exercises.append(W4C1Exercise1)
        W4C1Exercises.append(W4Break1)
        W4C1Exercises.append(W4C1Exercise2)
        W4C1Exercises.append(W4Break2)
        W4C1Exercises.append(W4C1Exercise3)
        W4C1Exercises.append(W4Break3)
        W4C1Exercises.append(W4C1Exercise4)
        W4C1Exercises.append(W4Break4)
        W4C1Exercises.append(W4C1Exercise5)
        W4C1Exercises.append(W4Break5)
        W4C1Exercises.append(W4C1Exercise6)
        W4C1Exercises.append(W4Break6)
        W4C1Exercises.append(W4C1Exercise7)
        W4C1Exercises.append(W4Break7)
        
        
        W4C1Exercises.append(W4C1Exercise1)
        W4C1Exercises.append(W4Break1)
        W4C1Exercises.append(W4C1Exercise2)
        W4C1Exercises.append(W4Break2)
        W4C1Exercises.append(W4C1Exercise3)
        W4C1Exercises.append(W4Break3)
        W4C1Exercises.append(W4C1Exercise4)
        W4C1Exercises.append(W4Break4)
        W4C1Exercises.append(W4C1Exercise5)
        W4C1Exercises.append(W4Break5)
        W4C1Exercises.append(W4C1Exercise6)
        W4C1Exercises.append(W4C1Exercise7)
       
        //Workout
        
        let W4 = Workout(index: 3, title: "Hero Makers", startAudio: "HeroSweatWelcome", endAudio: "WorkoutComplete", exercises: W4C1Exercises, exerciseCount: 7,  backgroundColor: teal )
        
        //5
        
        //Circuit1
        
        let W5C1Exercise1 = Exercise(counter: "1/4", title: "Circuit1", roundCount: 3, roundCounter: 1,time: 30, startaudio: "",  endaudio: "321Go")
        W5C1Exercises.append(W5C1Exercise1)
        let W5C1Exercise2 = Exercise(counter: "2/4",title: "Circuit1", roundCount: 3, roundCounter: 1,time: 30, startaudio: "LastExercise",  endaudio: "321Go")
        W5C1Exercises.append(W5C1Exercise2)
        let W5C1Exercise3 = Exercise(counter: "3/4",title: "Circuit1", roundCount: 3, roundCounter: 1,time: 30, startaudio: "",  endaudio: "321Go")
        W5C1Exercises.append(W5C1Exercise3)
        let W5C1Exercise4 = Exercise(counter: "4/4",title: "Circuit1", roundCount: 3, roundCounter: 1,time: 30, startaudio: "",  endaudio: "321Go")
        W5C1Exercises.append(W5C1Exercise4)
        
        let W5C1Exercise5 = Exercise(counter: "1/4", title: "Circuit1", roundCount: 3, roundCounter: 2,time: 30, startaudio: "",  endaudio: "321Go")
        W5C1Exercises.append(W5C1Exercise5)
        let W5C1Exercise6 = Exercise(counter: "2/4",title: "Circuit1", roundCount: 3, roundCounter: 2,time: 30, startaudio: "",  endaudio: "321Go")
        W5C1Exercises.append(W5C1Exercise6)
        let W5C1Exercise7 = Exercise(counter: "3/4",title: "Circuit1", roundCount: 3, roundCounter: 2,time: 30, startaudio: "",  endaudio: "321Go")
        W5C1Exercises.append(W5C1Exercise7)
        let W5C1Exercise8 = Exercise(counter: "4/4",title: "Circuit1", roundCount: 3, roundCounter: 2,time: 30, startaudio: "",  endaudio: "321Go")
        W5C1Exercises.append(W5C1Exercise8)
        
        let W5C1Exercise9 = Exercise(counter: "1/4", title: "Circuit1", roundCount: 3, roundCounter: 3,time: 30, startaudio: "",  endaudio: "321Go")
        W5C1Exercises.append(W5C1Exercise9)
        let W5C1Exercise10 = Exercise(counter: "2/4",title: "Circuit1", roundCount: 3, roundCounter: 3,time: 30, startaudio: "",  endaudio: "321Go")
        W5C1Exercises.append(W5C1Exercise10)
        let W5C1Exercise11 = Exercise(counter: "3/4",title: "Circuit1", roundCount: 3, roundCounter: 3,time: 30, startaudio: "",  endaudio: "321Go")
        W5C1Exercises.append(W5C1Exercise11)

        let W5C1Exercise12 = Exercise(counter: "4/4",title: "Circuit1", roundCount: 3, roundCounter: 3,time: 30, startaudio: "LastExercise",  endaudio: "30sBreak")
        W5C1Exercises.append(W5C1Exercise12)
 
        let W5Break = Exercise(counter: "4/4",title: "Take a break", roundCount: 3, roundCounter: 3,time: 30, startaudio: "",  endaudio: "321Go", isBreak: true)
        W5C1Exercises.append(W5Break)
        
        //Circuit2
    
        let W5C2Exercise1 = W5C1Exercise1.copy() as! Exercise
        W5C2Exercise1.title = "Circuit2"
        W5C1Exercises.append(W5C2Exercise1)
        let W5C2Exercise2 = W5C1Exercise2.copy() as! Exercise
        W5C2Exercise2.title = "Circuit2"
        W5C1Exercises.append(W5C2Exercise2)
        let W5C2Exercise3 = W5C1Exercise3.copy() as! Exercise
        W5C2Exercise3.title = "Circuit2"
        W5C1Exercises.append(W5C2Exercise3)
        let W5C2Exercise4 = W5C1Exercise4.copy() as! Exercise
        W5C2Exercise4.title = "Circuit2"
        W5C1Exercises.append(W5C2Exercise4)
        
        let W5C2Exercise5 = W5C1Exercise5.copy() as! Exercise
        W5C2Exercise5.title = "Circuit2"
        W5C1Exercises.append(W5C2Exercise5)
        let W5C2Exercise6 = W5C1Exercise6.copy() as! Exercise
        W5C2Exercise6.title = "Circuit2"
        W5C1Exercises.append(W5C1Exercise6)
        let W5C2Exercise7 = W5C1Exercise7.copy() as! Exercise
        W5C2Exercise7.title = "Circuit2"
        W5C1Exercises.append(W5C2Exercise7)
        let W5C2Exercise8 = W5C1Exercise8.copy() as! Exercise
        W5C2Exercise8.title = "Circuit2"
        W5C1Exercises.append(W5C2Exercise8)
       
        let W5C2Exercise9 = W5C1Exercise9.copy() as! Exercise
        W5C2Exercise9.title = "Circuit2"
        W5C1Exercises.append(W5C2Exercise9)
        let W5C2Exercise10 = W5C1Exercise10.copy() as! Exercise
        W5C2Exercise10.title = "Circuit2"
        W5C1Exercises.append(W5C2Exercise10)
        let W5C2Exercise11 = W5C1Exercise11.copy() as! Exercise
        W5C2Exercise11.title = "Circuit2"
        W5C1Exercises.append(W5C2Exercise11)
        let W5C2Exercise12 = W5C1Exercise12.copy() as! Exercise
        W5C2Exercise12.title = "Circuit2"
        W5C1Exercises.append(W5C2Exercise12)
       W5C1Exercises.append(W5Break)
        
        //Circuit3
        let W5C3Exercise1 = W5C1Exercise1.copy() as! Exercise
        W5C3Exercise1.title = "Circuit3"
        W5C1Exercises.append(W5C3Exercise1)
        let W5C3Exercise2 = W5C1Exercise2.copy() as! Exercise
        W5C3Exercise2.title = "Circuit3"
        W5C1Exercises.append(W5C3Exercise2)
        let W5C3Exercise3 = W5C1Exercise3.copy() as! Exercise
        W5C3Exercise3.title = "Circuit3"
        W5C1Exercises.append(W5C3Exercise3)
        let W5C3Exercise4 = W5C1Exercise4.copy() as! Exercise
        W5C3Exercise4.title = "Circuit3"
        W5C1Exercises.append(W5C3Exercise4)
        
        let W5C3Exercise5 = W5C1Exercise5.copy() as! Exercise
        W5C3Exercise5.title = "Circuit3"
        W5C1Exercises.append(W5C3Exercise5)
        let W5C3Exercise6 = W5C1Exercise6.copy() as! Exercise
        W5C3Exercise6.title = "Circuit3"
        W5C1Exercises.append(W5C3Exercise6)
        let W5C3Exercise7 = W5C1Exercise7.copy() as! Exercise
        W5C3Exercise7.title = "Circuit3"
        W5C1Exercises.append(W5C3Exercise7)
        let W5C3Exercise8 = W5C1Exercise8.copy() as! Exercise
        W5C3Exercise8.title = "Circuit3"
        W5C1Exercises.append(W5C3Exercise8)
        
        let W5C3Exercise9 = W5C1Exercise9.copy() as! Exercise
        W5C3Exercise9.title = "Circuit3"
        W5C1Exercises.append(W5C3Exercise9)
        let W5C3Exercise10 = W5C1Exercise10.copy() as! Exercise
        W5C3Exercise10.title = "Circuit3"
        W5C1Exercises.append(W5C2Exercise10)
        let W5C3Exercise11 = W5C1Exercise11.copy() as! Exercise
        W5C3Exercise11.title = "Circuit3"
        W5C1Exercises.append(W5C3Exercise11)
        let W5C3Exercise12 = W5C1Exercise12.copy() as! Exercise
        W5C3Exercise12.title = "Circuit3"
        W5C1Exercises.append(W5C3Exercise12)
        W5C1Exercises.append(W5Break)
        
        //Circuit4
        
        let W5C4Exercise1 = W5C1Exercise1.copy() as! Exercise
        W5C4Exercise1.title = "Circuit4"
        W5C1Exercises.append(W5C4Exercise1)
        let W5C4Exercise2 = W5C1Exercise2.copy() as! Exercise
        W5C4Exercise2.title = "Circuit4"
        W5C1Exercises.append(W5C4Exercise2)
        let W5C4Exercise3 = W5C1Exercise3.copy() as! Exercise
        W5C4Exercise3.title = "Circuit4"
        W5C1Exercises.append(W5C4Exercise3)
        let W5C4Exercise4 = W5C1Exercise4.copy() as! Exercise
        W5C4Exercise4.title = "Circuit4"
        W5C1Exercises.append(W5C4Exercise4)
        
        let W5C4Exercise5 = W5C1Exercise5.copy() as! Exercise
        W5C4Exercise5.title = "Circuit4"
        W5C1Exercises.append(W5C4Exercise5)
        let W5C4Exercise6 = W5C1Exercise6.copy() as! Exercise
        W5C4Exercise6.title = "Circuit4"
        W5C1Exercises.append(W5C4Exercise6)
        let W5C4Exercise7 = W5C1Exercise7.copy() as! Exercise
        W5C4Exercise7.title = "Circuit4"
        W5C1Exercises.append(W5C4Exercise7)
        let W5C4Exercise8 = W5C1Exercise8.copy() as! Exercise
        W5C4Exercise8.title = "Circuit4"
        W5C1Exercises.append(W5C4Exercise8)
        
        let W5C4Exercise9 = W5C1Exercise9.copy() as! Exercise
        W5C4Exercise9.title = "Circuit4"
        W5C1Exercises.append(W5C4Exercise9)
        let W5C4Exercise10 = W5C1Exercise10.copy() as! Exercise
        W5C4Exercise10.title = "Circuit4"
        W5C1Exercises.append(W5C4Exercise10)
        let W5C4Exercise11 = W5C1Exercise11.copy() as! Exercise
        W5C4Exercise11.title = "Circuit4"
        W5C1Exercises.append(W5C4Exercise11)
        let W5C4Exercise12 = W5C1Exercise12.copy() as! Exercise
        W5C4Exercise12.title = "Circuit4"
        W5C1Exercises.append(W5C4Exercise12)
       
      //Workouts
        
        let W5 = Workout(index: 4,title: "30 sec Burner", startAudio: "30secBurnerWelcome", endAudio: "WorkoutComplete", exercises: W5C1Exercises, exerciseCount: 4, backgroundColor: blue )
        
         workouts.append(W1)
         workouts.append(W2)
         workouts.append(W3)
         workouts.append(W4)
         workouts.append(W5)
    }
    
    func getWorkOuts() -> [Workout]{
        return workouts
    }
    
}
