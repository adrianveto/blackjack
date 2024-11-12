public class Gambler extends Player {
    private int balance;

    // CONSTRUCTORS
    public Gambler(String name) {
        super(name);
        balance = 500;
    }

    public Gambler(String name, int initialBalance) {
        super(name);
        balance = initialBalance;
    }

    // GETTERS
    public int getBalance() {
        return balance;
    }

    // SETTERS
    public void setBalance(int b) {
        balance = b;
    }

    // BALANCE METHODS
    public int removeBalance(int n) {
        if (balance < n) {
            balance = 0;
            return n - balance;
        }
        else {
            balance -= n;
            return n;
        }
    }

    public void addBalance(int n) {
        balance += n;
    }

    // ACTIONS
    public void hit(Deck deck) {
        draw(deck);
    }

    public void stand() {
        this.setIn(false);
    }
}
