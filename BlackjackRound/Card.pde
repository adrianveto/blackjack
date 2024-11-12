public class Card {
    private String name;
    private String suit;
    private PImage image;
    private int value;

    public Card (String name, String suit) {
        this.name = name;
        this.suit = suit;
        this.image = loadImage("../cardpics/" + name + suit + ".png");
        
        if (name.equals("Two")) {
            value = 2;
        }
        else if (name.equals("Three")) {
            value = 3;
        }
        else if (name.equals("Four")) {
            value = 4;
        }
        else if (name.equals("Five")) {
            value = 5;
        }
        else if (name.equals("Six")) {
            value = 6;
        }
        else if (name.equals("Seven")) {
            value = 7;
        }
        else if (name.equals("Eight")) {
            value = 8;
        }
        else if (name.equals("Nine")) {
            value = 9;
        }
        else if (name.equals("Ten")) {
            value = 10;
        }
        else if (name.equals("Jack")) {
            value = 10;
        }
        else if (name.equals("Queen")) {
            value = 10;
        }
        else if (name.equals("King")) {
            value = 10;
        }
        else if (name.equals("Ace")) {
            value = 11;
        }
    }

    public String toString() {
        return name + "\nof\n" + suit;
    }

    public String getName() {
        return name;
    }
    
    public PImage getImage() {
        return image;
    }

    public String getSuit() {
        return suit;
    }

    public int getValue() {
        return value;
    }
}
