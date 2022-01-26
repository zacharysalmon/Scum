//
//  GameViewController.swift
//  Scum
//
//  Created by Zack Salmon on 1/7/22.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation
import SwiftUI

class GameViewController: UIViewController
{
//	var numberOfPlayers: Int = 10
	var deck: Deck?
	var players: [Player] = [Player(name: "Zack"), Player(name: "Lyndsey"), Player(name: "Mike"),
							 Player(name: "Kelsey"), Player(name: "Josh"), Player(name: "Indi"),
							 Player(name: "Kirt"), Player(name: "Karen"), Player(name: "Haley"),
							 Player(name: "Cam")]
//__________________________________________________________________________________________________
//__________________________________________________________________________________________________
	
	
	
	/*
		This function loads the view after checking the bounds for the iOS device screen.
	*/
	override func loadView()
	{
		let skView = SKView(frame: UIScreen.main.bounds)
		self.view = skView
		
		deck = Deck(numberOfPlayers: players.count)

//		deck?.printDeck()
		deck?.shuffleDeck()
		distributeHands()

//		Image(players[0].hand.last!.card_name)
//		for each in players
//		{
//			each.printHand()
//		}
	}
	
	override func viewDidLoad()
	{
        super.viewDidLoad()
		
        if let view = self.view as? SKView
		{
            // Load the SKScene from 'GameScene.swift
			var scene: GameScene?
			scene = GameScene(size: self.view.bounds.size, game_view_controller: self)
			scene?.scaleMode = .aspectFit
			view.presentScene(scene)

			scene?.showCards(players: players)
//			scene!.addChild(SKNode(fileNamed: players[0].hand[0].card_name)!)
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
		
    }
	
	
	
	func distributeHands()
	{
		for each in players
		{
			each.hand = deck!.dealDeck()
//			each.printHand()
		}
		if deck!.deck.count != 0
		{
			for i in 0...deck!.deck.count - 1
			{
				players[i].hand.append(deck!.deck.popLast()!)
			}
		}
		for each in players
		{
			each.hand.sort(by: Card.lessThan(lhs:rhs:))
		}
	}
	
	
	/*
		This function sets up the sounds for the game. There are no sound effects, but it does
		allow for other sounds that can run in the background be played while the app is running.
	*/
	func setupSounds()
	{
		// Let's the user listen to outside audio while the app is playing.
		try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
		try? AVAudioSession.sharedInstance().setActive(true)
	}


}
