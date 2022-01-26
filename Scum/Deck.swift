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

	let card_fronts: [String] =
	[
		"2_of_spades", "3_of_spades", "4_of_spades", "5_of_spades", "6_of_spades", "7_of_spades", "8_of_spades", "9_of_spades", "10_of_spades", "jack_of_spades", "queen_of_spades", "king_of_spades", "ace_of_spades",

		"2_of_diamonds", "3_of_diamonds", "4_of_diamonds", "5_of_diamonds", "6_of_diamonds", "7_of_diamonds", "8_of_diamonds", "9_of_diamonds", "10_of_diamonds", "jack_of_diamonds", "queen_of_diamonds", "king_of_diamonds", "ace_of_diamonds",

		"2_of_clubs", "3_of_clubs", "4_of_clubs", "5_of_clubs", "6_of_clubs", "7_of_clubs", "8_of_clubs", "9_of_clubs", "10_of_clubs", "jack_of_clubs", "queen_of_clubs", "king_of_clubs", "ace_of_clubs",

		"2_of_hearts", "3_of_hearts", "4_of_hearts", "5_of_hearts", "6_of_hearts", "7_of_hearts", "8_of_hearts", "9_of_hearts", "10_of_hearts", "jack_of_hearts", "queen_of_hearts", "king_of_hearts", "ace_of_hearts"
	]
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
		let hand: [Card] = Array(handSlice)
		
		deck.removeSubrange(..<cardsPerPlayer)
		
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
		deck.append(Card(suit: 5, rank: 15, card_name: "red_joker"))
		deck.append(Card(suit: 5, rank: 15, card_name: "black_joker"))
	}
	
	
	fileprivate func addPlayingCards()
	{
		let min_suit = 1
		let max_suit = 4
		let suit_offset = 1

		let min_rank = 2
		let max_rank = 14
		let rank_offset = 2


		for i in min_suit...max_suit
		{
			for j in min_rank...max_rank
			{
//				print(((i - 1) * (max_rank - 1)) + (j - 2))
				let card = Card(suit: i, rank: j,
								card_name: card_fronts[((i - suit_offset) * (max_rank - 1)) + (j - rank_offset)])
				self.deck.append(card)
			}
			
		}
	}
	
	
}
