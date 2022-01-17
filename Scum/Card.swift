//
//  Card.swift
//  Scum
//
//  Created by Zack Salmon on 1/17/22.
//

import Foundation

class Card
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
	
	init(suit: Int, rank: Int)
	{
		self.suit = Suit(rawValue: suit)!
		self.rank = Rank(rawValue: rank)!
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
		return "suit: " + String(suit.rawValue) + " rank: " + String(rank.rawValue)
	}
	
	
}
