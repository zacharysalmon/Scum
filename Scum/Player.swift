//
//  Player.swift
//  Scum
//
//  Created by Zack Salmon on 1/17/22.
//

import Foundation

class Player
{
	var name: String
	var hand: [Card] = []
	
	init(name: String)
	{
		self.name = name
		self.hand = []
	}
	
	init(hand: [Card], name: String)
	{
		self.name = name
		self.hand = hand
	}
	
	func printHand()
	{
		print(name + "'s hand:")
		for each in hand
		{
			print(each.toString())
		}
	}
	
	
}
