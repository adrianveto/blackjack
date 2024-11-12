public class Dealer extends Player {

    // CONSTRUCTORS
    public Dealer(String name) {
        super(name);
    }

    // DEALER ACTION
    public void dealerAction(Deck deck) {
        if (this.findScore() >= 17) {
            this.setIn(false);
        }
        else {
            draw(deck);
        }
    }
}
