//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Marwin Wiechert on 20.01.18.
//  Copyright © 2018 Marwin Wiechert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Imgs: String {
        case Rock = "rock"
        case Paper  = "paper"
        case Scissors = "scissors"
        case Tie = "itsATie"
        case PaperCoversRock = "PaperCoversRock"
        case RockCrushesScissors = "RockCrushesScissors"
        case ScissorsCutPaper = "ScissorsCutPaper"
    }
    
    enum Choice {
        case Scissors
        case Paper
        case Rock
        
        //        var image: UIImage{
        //            switch self{
        //            case .scissors: return UIImage(named: "scissors")!
        //            case .paper: return UIImage(named: "paper")!
        //            case .rock: return UIImage(named: "rock")!
        //            }
        //        }
    }
    
    struct GameResult {
        var title: String?
        var image: UIImage?
    }
    
    @IBOutlet weak var out_rock: UIButton!
    @IBOutlet weak var out_scissors: UIButton!
    @IBOutlet weak var out_paper: UIButton!
    
    @IBAction func calculateResult(_ sender: Any) {
        let  controller: ResultsViewController
        var gameResult: GameResult = GameResult(title: "Hallo", image: UIImage(named: "rock")!)
        
        controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        
        if out_rock.isTouchInside {
            gameResult = compareChoices(playersChoice: Choice.Rock, computersChoice: calculateRandomGuess())
        }else if out_scissors.isTouchInside{
            gameResult = compareChoices(playersChoice: Choice.Scissors, computersChoice: calculateRandomGuess())
        }else if out_paper.isTouchInside{
            gameResult = compareChoices(playersChoice: Choice.Paper, computersChoice: calculateRandomGuess())
        }else{
            print("Something went wrong")
        }
        
        controller.headingText = gameResult.title
        controller.image = gameResult.image
        present(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func compareChoices(playersChoice:Choice, computersChoice:Choice) -> GameResult{
        let playerWon: String = "Nice job! You won!"
        let playerLost: String = "You lost..."
        let tie: String = "It's a tie"
        
        var returnTitle: String
        var returnImage: UIImage
        
        if playersChoice == Choice.Paper {
            switch computersChoice{
            case .Paper:
                returnTitle = tie
                returnImage = UIImage(named: Imgs.Tie.rawValue)!
            case .Rock:
                returnTitle = playerWon
                returnImage = UIImage(named: Imgs.PaperCoversRock.rawValue)!
            case .Scissors:
                returnTitle = playerLost
                returnImage = UIImage(named: Imgs.ScissorsCutPaper.rawValue)!
            }
            
        }
        else if playersChoice == Choice.Rock {
            switch computersChoice{
            case .Paper:
                returnTitle = playerLost
                returnImage = UIImage(named: Imgs.PaperCoversRock.rawValue)!
            case .Rock:
                returnTitle = tie
                returnImage = UIImage(named: Imgs.Tie.rawValue)!
            case .Scissors:
                returnTitle = playerWon
                returnImage = UIImage(named: Imgs.RockCrushesScissors.rawValue)!
            }
        }
        else if playersChoice == Choice.Scissors {
            switch computersChoice{
            case .Paper:
                returnTitle = playerWon
                returnImage = UIImage(named: Imgs.ScissorsCutPaper.rawValue)!
            case .Rock:
                returnTitle = playerLost
                returnImage = UIImage(named: Imgs.RockCrushesScissors.rawValue)!
            case .Scissors:
                returnTitle = tie
                returnImage = UIImage(named: Imgs.Tie.rawValue)!
            }
        }
            
        else{
            returnTitle = "Something went wrong"
            returnImage = UIImage(named: "rock")!
        }
        return GameResult(title: returnTitle, image: returnImage)
    }
    
    func calculateRandomGuess() -> Choice{
        
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        
        if randomValue == 1 {
            print(Choice.Rock)
            return Choice.Rock
        }else if randomValue == 2{
            print(Choice.Scissors)
            return Choice.Scissors
        }else if randomValue == 3{
            print(Choice.Paper)
            return Choice.Paper
        }else{
            print("random number was not calculated correctly. Number was: \(randomValue)")
            return Choice.Scissors
        }
    }
    
}

