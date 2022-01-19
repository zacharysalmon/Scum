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
	let numberOfPlayers: Int
	var cardsPerPlayer: Int
//__________________________________________________________________________________________________
//__________________________________________________________________________________________________
	
	
	
	init (numberOfPlayers: Int)
	{
		self.numberOfPlayers = numberOfPlayers
		self.cardsPerPlayer = 0
		let numberOfDecks = numberOfPlayers / 2

		for _ in 0...numberOfDecks
		{
			addPlayingCards()
			addJokers()
		}
		self.cardsPerPlayer = deck.count / numberOfPlayers
	}
	
	
	
	func shuffleDeck()
	{
		self.deck.shuffle()
	}
	
	
	func dealDeck() -> [Card]
	{
		let handSlice: ArraySlice<Card> = deck[..<cardsPerPlayer]
		var hand: [Card] = Array(handSlice)
		
		deck.removeSubrange(..<cardsPerPlayer)
		hand.sort(by: Card.lessThan(lhs:rhs:))
		
//		print("cardsPerPlayer: " + String(cardsPerPlayer))
//		print(String(hand.count) + " cards taken.")
//		print("cards left: " + String(deck.count))
		return hand
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
	 The joker's rank gets changed to the rank of other the cards it is played with, or stays as the highest value if played as an ace.
	 */
	fileprivate func addJokers()
	{
		deck.append(Card(suit: 5, rank: 15))
		deck.append(Card(suit: 5, rank: 15))
	}
	
	
	fileprivate func addPlayingCards()
	{
		for i in 1...4
		{
			for j in 2...14
			{
				let card = Card(suit: i, rank: j)
				self.deck.append(card)
			}
			
		}
	}
	
	
}
