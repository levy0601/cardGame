//
//  ViewController.swift
//  cardGame
//
//  Created by Hao Liu on 10/2/20.
//

import UIKit

class ViewController: UIViewController {
    typealias Result = (hasWinner: Bool, winner: String)


    @IBOutlet weak var player1Card3: UIImageView!
    @IBOutlet weak var player1Card2: UIImageView!
    @IBOutlet weak var player1Card1: UIImageView!
    
    @IBOutlet weak var player2Card1: UIImageView!
    @IBOutlet weak var player2Card2: UIImageView!
    @IBOutlet weak var player2Card3: UIImageView!
    
    @IBOutlet weak var lblWinner: UILabel!

    var cards :[String] = []
    var player1CardsImageView : [UIImageView] = []
    var player2CardsImageView : [UIImageView] = []
    let aceOfspade = "AS"


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initial()
    }
    
    func initial (){
        initialCards()
        initialPlayerCardsImageView()
        setPlayerCardsBackground()
        setDefaultWinnerLabel()
        
    }
    
    @IBAction func playGame(_ sender: Any) {
        let result : Result = pickCard()
        if result.hasWinner {
            lblWinner.text = "Winner  : \(result.winner)"
            let alert = UIAlertController(title: "Do you want to PLAY AGIAN? ", message:"Winner is \(result.winner)" , preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (UIAlertAction) in
                self.initial()
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    

    
    func pickCard() -> Result{
        var cardpool : [String] = cards;
        print(cardpool.count)
        
        var result : Result = (hasWinner : false, winner : "")
        
        //player 1
        for n in 0..<3 {
            let index = Int.random(in: 0..<cardpool.count)
            let pickedCard : String = cardpool[index]
            if pickedCard == aceOfspade{
                result.hasWinner = true
                result.winner = "Player 1"
            }
            player1CardsImageView[n].image = UIImage(named: pickedCard)
            cardpool.remove(at: index)
        }
        

        //player 2
        for j in 0..<3 {
            let index = Int.random(in: 0..<cardpool.count)
            let pickedCard : String = cardpool[index]
            if pickedCard == aceOfspade{
                result.hasWinner = true
                result.winner = "Player 2"
            }
            player2CardsImageView[j].image = UIImage(named: pickedCard)
            cardpool.remove(at: index)
        }
        
        return result

    }
    
    func initialCards() {
        cards = []
        for n in 2...10{
            cards.append("\(n)C")
            cards.append("\(n)D")
            cards.append("\(n)H")
            cards.append("\(n)S")
        }
        cards.append("AC")
        cards.append("AD")
        cards.append("AH")
        cards.append("AS")
        cards.append("JC")
        cards.append("JD")
        cards.append("JH")
        cards.append("JS")
        cards.append("QC")
        cards.append("QD")
        cards.append("QH")
        cards.append("QS")
        cards.append("KC")
        cards.append("KD")
        cards.append("KH")
        cards.append("KS")
    }
    
    func initialPlayerCardsImageView() {
        player1CardsImageView = [player1Card3,player1Card2,player1Card1]
        player2CardsImageView = [player2Card3,player2Card2,player2Card1]
    }
    
    func setPlayerCardsBackground() {
        for imageView in player1CardsImageView {
            imageView.image = #imageLiteral(resourceName: "blue_back")
        }
        for imageView in player2CardsImageView {
            imageView.image = #imageLiteral(resourceName: "blue_back")
        }
    }
    
    func setDefaultWinnerLabel() {
        lblWinner.text = "Winner : Undecided"
    }
    


}

