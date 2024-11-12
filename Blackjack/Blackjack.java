import java.util.Arrays;

public class Blackjack {
    private Dealer dealer;
    private Gambler player1;
    private Deck deck;
    private boolean isActive;
    private int dealerWins;
    private int playerWins;
    private int pot;

    public Blackjack() {
        dealer = new Dealer("dealer");
        player1 = new Gambler("player1");
        deck = new Deck();
        deck.shuffle();
        isActive = true;
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

    public int getPot() {
        return pot;
    }

    // METHODS
    public boolean checkActive() {
        isActive = (dealer.getActive() || player1.getActive()) && !(dealer.getBusted() || player1.getBusted());
        return isActive;
    }

    public void reset() {
        dealer.reset();
        player1.reset();
        deck.shuffle();
        isActive = true;
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
        else if (dealer.getHand.size() == 5) {
            return 1;
        }
        else if (player.getHand.size() == 5) {
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

    public void placeBet(int n) {
        pot += 2 * player1.removeBalance(n);
    }

    public void dealerTurn() {
        dealer.dealerAction();
        checkActive();
    }

    public void playerTurn() {
        // BASED ON PLAYER INPUt
        checkActive();
    }
}
