public class Tester {
    public static void main(String[] args) {
        Deck deck = new Deck();
        deck.shuffle();
        // System.out.println(deck.draw());
        // System.out.println(Arrays.toString(deck.draw(3)));

        Dealer dealer = new Dealer("dealer");
        Gambler player1 = new Gambler("player1");
        System.out.println(dealer);
        dealer.dealerAction(deck);
        System.out.println(dealer);
        dealer.dealerAction(deck);
        System.out.println(dealer);
        dealer.dealerAction(deck);
        System.out.println(dealer);
        dealer.dealerAction(deck);
        System.out.println(dealer);
        dealer.dealerAction(deck);
        System.out.println(dealer);
    }
}
