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

class GameViewController: UIViewController
{

	var deck: Deck? = Deck()
	
//__________________________________________________________________________________________________
//__________________________________________________________________________________________________
	
	
	
	/*
		This function loads the view after checking the bounds for the iOS device screen.
	*/
	override func loadView()
	{
		let skView = SKView(frame: UIScreen.main.bounds)
		self.view = skView
//		print("p")
	}
	
	override func viewDidLoad()
	{
        super.viewDidLoad()
		
        if let view = self.view as? SKView
		{
            // Load the SKScene from 'GameScene.swift
			var scene: GameScene?
			scene = GameScene(size: self.view.bounds.size, game_scene: self)
			scene?.scaleMode = .aspectFit
			view.presentScene(scene)
            
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
		
		deck?.shuffleDeck()
		deck?.printDeck()
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
