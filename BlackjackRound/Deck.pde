import java.util.Random;
import java.util.ArrayList;

public class Deck {
    private Card[] baseDeck;

    private ArrayList<Card> deck;

    public Deck() {
        baseDeck = new Card[] {
            new Card("Ace", "Hearts"),
            new Card("Ace", "Diamonds"),
            new Card("Ace", "Spades"),
            new Card("Ace", "Clubs"),
    
            new Card("King", "Hearts"),
            new Card("King", "Diamonds"),
            new Card("King", "Spades"),
            new Card("King", "Clubs"),
    
            new Card("Queen", "Hearts"),
            new Card("Queen", "Diamonds"),
            new Card("Queen", "Spades"),
            new Card("Queen", "Clubs"),
    
            new Card("Jack", "Hearts"),
            new Card("Jack", "Diamonds"),
            new Card("Jack", "Spades"),
            new Card("Jack", "Clubs"),
    
            new Card("Ten", "Hearts"),
            new Card("Ten", "Diamonds"),
            new Card("Ten", "Spades"),
            new Card("Ten", "Clubs"),
    
            new Card("Nine", "Hearts"),
            new Card("Nine", "Diamonds"),
            new Card("Nine", "Spades"),
            new Card("Nine", "Clubs"),
    
            new Card("Eight", "Hearts"),
            new Card("Eight", "Diamonds"),
            new Card("Eight", "Spades"),
            new Card("Eight", "Clubs"),
    
            new Card("Seven", "Hearts"),
            new Card("Seven", "Diamonds"),
            new Card("Seven", "Spades"),
            new Card("Seven", "Clubs"),
    
            new Card("Six", "Hearts"),
            new Card("Six", "Diamonds"),
            new Card("Six", "Spades"),
            new Card("Six", "Clubs"),
    
            new Card("Five", "Hearts"),
            new Card("Five", "Diamonds"),
            new Card("Five", "Spades"),
            new Card("Five", "Clubs"),
    
            new Card("Four", "Hearts"),
            new Card("Four", "Diamonds"),
            new Card("Four", "Spades"),
            new Card("Four", "Clubs"),
    
            new Card("Three", "Hearts"),
            new Card("Three", "Diamonds"),
            new Card("Three", "Spades"),
            new Card("Three", "Clubs"),
    
            new Card("Two", "Hearts"),
            new Card("Two", "Diamonds"),
            new Card("Two", "Spades"),
            new Card("Two", "Clubs")
        };

        deck = new ArrayList<Card>(0);
    }

    public void shuffle() {
        deck = new ArrayList<Card>(0);
        Random rand = new Random();
        deck.add(baseDeck[0]);
        for (int i = 1; i < baseDeck.length; i++) {
            int pos = rand.nextInt(deck.size());
            deck.add(pos, baseDeck[i]);
        }
    }

    public void burn() {
        deck.remove(0);
    }

    public Card draw() {
        return deck.remove(0);
    }

    public Card[] draw(int n) {
        Card[] result = new Card[n];
        for (int i = 0; i < n; i++) {
            result[i] = deck.remove(0);
        }
        return result;
    }
}
