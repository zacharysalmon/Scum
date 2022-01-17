//
//  Deck.swift
//  Scum
//
//  Created by Zack Salmon on 1/17/22.
//

import Foundation

class Deck
{
	
	var deck: [Card] = []
	
	init()
	{
		for i in 1...4
		{
			for j in 2...14
			{
				let card = Card(suit: i, rank: j)
				self.deck.append(card)
			}
		}
		addJokers()
	}
	
	
	
	func shuffleDeck()
	{
		self.deck.shuffle()
	}
	
	
	func dealDeck(numberOfPlayers: Int)
	{
		for i in 0...numberOfPlayers
		{
			
		}
	}
	
	
	
	func printDeck()
	{
		for each in deck
		{
			print(each.toString())
		}
		print("\n")
	}
	
	
	/*
	 Adds 2 jokers to the end of the deck, since each deck should come with two jokers.
	 Jokers have a suit value that doesn't match any other suits, and rank 15 to signify the highest rank possible.
	 The rank gets changed to the rank of other cards it is played with, or stays as the highest value if played as an ace.
	 */
	func addJokers()
	{
		deck.append(Card(suit: 5, rank: 15))
		deck.append(Card(suit: 5, rank: 15))
	}
	
	
}
