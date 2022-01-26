//
//  GameScene.swift
//  Scum
//
//  Created by Zack Salmon on 1/7/22.
//

import SpriteKit
import GameplayKit
import SwiftUI


class GameScene: SKScene
{
	
	var pause_node: SKSpriteNode!
	var score_node: SKLabelNode!
	var game_view_controller: GameViewController!
	var countdown_node: SKLabelNode!

	struct ContentView: View
	{
		var body: some View
		{
			Image("ace_of_spades").colorInvert()
			
		}
	}

	struct ContentView_Previews: PreviewProvider
	{
		static var previews: some View
		{
			ContentView()
		}
	}
    
	init(size: CGSize, game_view_controller: GameViewController!)
	{
		super.init(size: size)
		self.game_view_controller = game_view_controller
		self.backgroundColor = UIColor(red: 0.0, green: 0.8, blue: 0.5, alpha: 1.0)

		self.score_node = SKLabelNode(text: "Score: 0")
		self.score_node.fontColor = UIColor.black
		self.score_node.fontSize = 30
		let score_node_position = CGPoint(x: size.width / 2, y: size.height * 0.8)
		self.score_node.position = score_node_position

		print(size)
		var x_pos = 70.0
		var y_pos = 330.0
		for each in game_view_controller.players[0].hand
		{

			each.position = CGPoint(x: x_pos, y: y_pos)
			each.starting_pos = each.position
			self.addChild(each)
//			print(each.toString() + " " + String(x_pos))
			if x_pos < size.width - each.size.width
			{
				x_pos += 30.0
			}
			else
			{
				x_pos -= 270.0
				y_pos -= 75.0
			}
		}
		
//		self.addChild(self.pause_node)
//		self.addChild(self.score_node)
		
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
	}
	
    override func didMove(to view: SKView)
	{
        
    }


	func showCards(players: [Player])
	{
//		self.addChild(players[0].hand[0])
//		self.addChild(SKNode(fileNamed: players[0].hand[0].card_name)!)
	}
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		
	}

	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		var hold: [Card:CGPoint] = [:]
		
		
		for touch in touches
		{
			let location = touch.location(in: self)
			var x_pos = 100.0
			let y_pos = 500.0

			if let card = atPoint(location) as? Card
			{
				if card.zPosition != 0.0
				{
					card.zPosition = 0.0
					card.position = card.starting_pos
				}
				else
				{
					card.zPosition = 5.0
					card.position = CGPoint(x: x_pos, y: y_pos)
				}
			}
		}
	}
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
	{

		
    }
    
	func changeScene()
	{
		let s = SettingsScene(size: self.view!.bounds.size, game_view_controller: game_view_controller)
		s.scaleMode = .aspectFill
		view?.presentScene(s)
	}
    
    override func update(_ currentTime: TimeInterval)
	{
        // Called before each frame is rendered
    }
}
