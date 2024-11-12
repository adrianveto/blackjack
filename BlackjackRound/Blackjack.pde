import java.util.Arrays;

public class Blackjack {
    private Dealer dealer;
    private Gambler player1;
    private Deck deck;
    private boolean isActive;
    private boolean preround;
    private int dealerWins;
    private int playerWins;
    private float pot;

    public Blackjack() {
        dealer = new Dealer("dealer");
        player1 = new Gambler("player1");
        deck = new Deck();
        deck.shuffle();
        isActive = true;
        preround = true;
        dealerWins = 0;
        playerWins = 0;
        pot = 0;
    }

    // GETTERS
    public int getDealerWins() {
        return dealerWins;
    }

    public int getPlayerWins() {
        return playerWins;
    }

    public boolean getActive() {
        return isActive;
    }

    public float getPot() {
        return pot;
    }

    public void setPot(float n) {
        pot = n;
    }

    public void dealerWin() {
        dealerWins++;
    }

    public void playerWin() {
        playerWins++;
    }
    
    public Dealer getDealer() {
     return dealer; 
    }
    
    public Gambler getPlayer() {
     return player1; 
    }

    // METHODS
    public boolean checkActive() {
        isActive = (dealer.getActive() || player1.getActive()) && !(dealer.getBusted() || player1.getBusted());
        if (player1.getHand().size() == 2 && player1.getScore() == 21) {
           isActive = false; 
        }
        else if (dealer.getHand().size() == 2 && dealer.getScore() == 21) {
            isActive = false; 
        }
        return isActive;
    }

    public void setActive(boolean b) {
        isActive = b;
    }

    public boolean preround() {
        return preround;
    }

    public void setPreround(boolean b) {
        preround = b;
    }

    public void reset() {
        dealer.reset();
        player1.reset();
        deck.shuffle();
        isActive = true;
        preround = true;
        if (winner() == 1) {
            dealerWins++;
        }
        else if (winner() == 2) {
            playerWins++;
            player1.addBalance(pot);
        }
        pot = 0;
    }

    // WINNER: tie = 0; dealer = 1; player1 = 2
    public int winner() {
        if (dealer.getBusted() && player1.getBusted()) {
            return 0;
        }
        else if (player1.getBusted()) {
            return 1;
        }
        else if (dealer.getBusted()) {
            return 2;
        }
        else if (dealer.getScore() == 21 && dealer.getHand().size() == 2 && player1.getScore() == 21 && player1.getHand().size() == 2) {
            return 0;
        }
        else if (dealer.getScore() == 21 && dealer.getHand().size() == 2) {
            return 1;
        }
        else if (dealer.getHand().size() == 5) {
            return 1;
        }
        else if (player1.getHand().size() == 5) {
            return 2;
        }
        else if (player1.getScore() == 21 && player1.getHand().size() == 2) {
            return 2;
        }
        else if (dealer.getScore() == player1.getScore()) {
            return 0;
        }
        else if (dealer.getScore() > player1.getScore()) {
            return 1;
        }
        else {
            return 2;
        }
    }

    public void placeBet(float n) {
        pot += 2 * player1.removeBalance(n);
    }

    public void dealerTurn() {
        dealer.dealerAction(deck);
        checkActive();
    }

    // FOR TESTING
    public void dealerHit() {
        dealer.draw(deck);
        checkActive();
    }

    public void playerHit() {
        player1.hit(deck);
        checkActive();
    }
    public void playerStand() {
        player1.stand();
        checkActive();
    }
    
    public void startRound() {
        preround = false;
        player1.draw(deck);
        dealer.draw(deck);
        player1.draw(deck);
        dealer.draw(deck);
    }
}
