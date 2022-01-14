//
//  SettingsScene.swift
//  Scum
//
//  Created by Zack Salmon on 1/7/22.
//

import SpriteKit
import GameplayKit

class SettingsScene: SKScene
{
	
	var pause_node: SKSpriteNode!
	var score_node: SKLabelNode!
	var game_scene: GameViewController!
	var countdown_node: SKLabelNode!
	
	init(size: CGSize, game_scene: GameViewController!)
	{
		super.init(size: size)
		self.game_scene = game_scene
		self.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
		
		let spriteSize = CGSize(width: 50.0, height: 50.0)
		self.pause_node = SKSpriteNode(imageNamed: "pause_button")
		self.pause_node.size = spriteSize
		self.pause_node.position = CGPoint(x: size.width - spriteSize.width, y: spriteSize.height)
		
		self.score_node = SKLabelNode(text: "Score: 0")
		self.score_node.fontName = "Georgia-Bold"
		self.score_node.fontColor = UIColor.black
		self.score_node.fontSize = 30
		let score_node_position = CGPoint(x: size.width / 2, y: size.height * 0.8)
		self.score_node.position = score_node_position
		
		self.countdown_node = SKLabelNode(text: "3")
		self.countdown_node.fontName = "Georgia-Bold"
		self.countdown_node.fontColor = UIColor.black
		self.countdown_node.fontSize = 50
		let countdown_node_position = CGPoint(x: size.width / 2, y: size.height / 2)
		self.countdown_node.position = countdown_node_position
		
		
		self.addChild(self.pause_node)
		self.addChild(self.score_node)
		self.addChild(self.countdown_node)
		
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
		
	}
	
	override func didMove(to view: SKView)
	{
		
	}
	
	
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		let location = touches.first?.location(in: self)
		print("2")
		changeScene()
		
	}
		
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		
	}
	
	
	func changeScene()
	{
		let s = GameScene(size: self.view!.bounds.size, game_scene: game_scene)
		s.scaleMode = .aspectFit
		view?.presentScene(s)
	}
	
	override func update(_ currentTime: TimeInterval)
	{
		// Called before each frame is rendered
	}
}
