import java.util.ArrayList;

public class Player {
    private ArrayList<Card> hand;
    private String name;
    private int score;
    private boolean isBusted;
    private boolean isActive;

    // CONSTRUCTORS
    public Player(String name) {
        this.name = name;
        hand = new ArrayList<Card>(0);
        score = 0;
        isBusted = false;
        isActive = true;
    }

    // GETTERS
    public ArrayList<Card> getHand() {
        return hand;
    }

    public String getName() {
        return name;
    }

    public boolean getBusted() {
        return isBusted;
    }

    public boolean getActive() {
        return isActive;
    }

    public boolean getStatus() {
        return isActive && !isBusted;
    }

    public int getScore() {
        return score;
    }

    public int findScore() {
        int result = 0;
        int aces = 0;
        for (int i = 0; i < hand.size(); i++) {
            if (hand.get(i).getValue() == 11) {
                aces++;
            }
            else {
                result += hand.get(i).getValue();
            }
        }
        while (aces > 0) {
            if (result <= 11 - aces) {
                result += 11;
            }
            else {
                result += 1;
            }
            aces--;
        }
        score = result;
        if (score > 21) {
            isBusted = true;
        }
        return result;
    }

    public String toString() {
        String result = "Player " + name + " has a score of " + score + " and is holding cards [";
        if (hand.size() > 0) {
            for (int i = 0; i < hand.size() - 1; i++) {
                result += hand.get(i) + ", ";
            }
            result += hand.get(hand.size() - 1) + "]";
        }
        else {
            result += "]";
        }
        return result;
    }

    // SETTERS
    public void setName(String name) {
        this.name = name;
    }

    public void setHand(ArrayList<Card> hand) {
        this.hand = hand;
        findScore();
    }

    public void setBusted(boolean busted) {
        isBusted = busted;
    }

    public void setIn(boolean in) {
        isActive = in;
    }

    // DRAW
    public void draw(Deck deck) {
        hand.add(deck.draw());
        findScore();
    }

    public void reset() {
        hand = new ArrayList<Card>(0);
        isBusted = false;
        isActive = true;
        score = 0;
    }
}
