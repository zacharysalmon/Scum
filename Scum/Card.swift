//
//  Card.swift
//  Scum
//
//  Created by Zack Salmon on 1/17/22.
//

import Foundation
import SpriteKit

class Card: SKSpriteNode
{
	enum Rank: Int
	{
		case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace, joker
	}
	
	enum Suit: Int
	{
		case spades = 1, diamonds, clubs, hearts, joker
	}
	
	var rank: Rank
	var suit: Suit
	var card_name: String
	var front: SKTexture
	var starting_pos: CGPoint
	

	init(suit: Int, rank: Int, card_name: String)
	{
		self.suit = Suit(rawValue: suit)!
		self.rank = Rank(rawValue: rank)!
		self.card_name = card_name
		self.front = SKTexture(imageNamed: card_name)
		self.starting_pos = CGPoint(x: 0.0, y: 0.0)
		super.init(texture: SKTexture(imageNamed: card_name),
				   color: .clear,
				   size: CGSize(width: 100, height: 150))
	}

	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}

	
	static func greaterThan(lhs: Card, rhs: Card) -> Bool
	{
		return lhs.rank.rawValue > rhs.rank.rawValue
	}
	
	
	
	static func lessThan(lhs: Card, rhs: Card) -> Bool
	{
		return lhs.rank.rawValue < rhs.rank.rawValue
	}
	
	
	
	func toString() -> String
	{
		return "suit: " + String(self.suit.rawValue)
		+ " rank: " + String(self.rank.rawValue)
		+ " card_name: " + self.card_name
	}
	
	
}
