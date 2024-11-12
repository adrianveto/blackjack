public class Gambler extends Player {
    private float balance;

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
    public float getBalance() {
        return balance;
    }

    // SETTERS
    public void setBalance(int b) {
        balance = b;
    }

    // BALANCE METHODS
    public float removeBalance(float n) {
        if (balance < n) {
            float temp = balance;
            balance = 0;
            return temp;
        }
        else {
            balance -= n;
            return n;
        }
    }

    public void addBalance (float n) {
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
