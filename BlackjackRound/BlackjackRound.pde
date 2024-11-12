import controlP5.*;
Blackjack round;
Button hit;
Button stand;
Button newRound;
Button bet;
Button newGame;
Slider betAmount;
PImage backCard;

  

ControlP5 cp5;
color b1, b2;
int X_AXIS = 1;
int Y_AXIS = 2;

void setup() {
  size(1000, 1000);
  cp5 = new ControlP5(this);
  round  = new Blackjack();
  
  //background colors
  b1 = color(26, 110, 49);
  b2 = color(83, 194, 114);
  
  //button functionality
  newRound = cp5.addButton("New Round")
     .setValue(0)
     .setPosition(25, 100)
     .setSize(200, 50)
     .setColorBackground(0)
     ;
  newGame = cp5.addButton("New Game")
     .setValue(0)
     .setPosition(25, 25)
     .setSize(200, 50)
     .setColorBackground(0)
     ;
  hit = cp5.addButton("Hit")
     .setValue(0)
     .setPosition(25, 775)
     .setSize(200, 50)
     .setColorBackground(0)
     ;
  stand = cp5.addButton("Stand")
     .setValue(0)
     .setPosition(25, 850)
     .setSize(200, 50)
     .setColorBackground(00)
     ;
  bet = cp5.addButton("Place Bet")
     .setValue(0)
     .setPosition(775, 825)
     .setSize(100, 50)
     .setColorBackground(00)
     ;
  betAmount = cp5.addSlider("Bet Amount")
     .setPosition(915, 730)
     .setSize(50, 250)
     .setRange(0, round.getPlayer().getBalance()) //slider increments based on balance
     .setValue(10)
     .setNumberOfTickMarks(11)
     .setColorCaptionLabel(color(20, 20, 20))
     .setColorBackground(0)
     ;
    backCard = loadImage("../cardpics/back.png");


    
    

   
   // round.playerHit();
  // round.playerHit();
  // round.playerHit();
  // round.playerHit();
  // round.playerHit();
  // round.dealerHit();
  // round.dealerHit();
  // round.dealerHit();
  // round.dealerHit();
  // round.dealerHit();
}

void draw() {
  setGradient(0, 0, width / 2, height, b1, b2, X_AXIS);
  setGradient(width / 2, 0, width / 2, height, b2, b1, X_AXIS);
  textSize(20);
  fill(255, 255, 255);
  double curBalance = round.getPlayer().getBalance();
  curBalance = Math.floor(curBalance * 100) / 100;
  text("Current Balance: " + curBalance, 875, 715);
  fill(#C63D36);
  rect(250, 0, 500, 300);
  displayDealerHand();
  fill(#C63D36);
  rect(250, 700, 500, 300);
  displayPlayerHand();

  // DEALER ACTIONS
  if (round.getActive() && !round.getPlayer().getActive()) {
    round.dealerTurn();
    delay(3);
  }

  if (!round.getActive()) {
    textSize(50);
    textAlign(CENTER);
    fill(255, 0, 0);
    int winner = round.winner();
    if (winner == 0) {
      text("ROUND TIED", 500, 500);
      round.getPlayer().addBalance(round.getPot() / 2);
      round.setPot(0);
    }
    else if (winner == 1) {
      text("DEALER WINS", 500, 500);
      round.setPot(0);
      round.dealerWin();
    }
    else {
      text("PLAYER WINS", 500, 500);
      round.getPlayer().addBalance(round.getPot());
      round.setPot(0);
      round.playerWin();
    }
  }
  else {
    textSize(30);
    fill(255, 255, 255);
    textAlign(CENTER);
    text("Pot\n" + round.getPot(), 500, 500);
  }
}

void displayPlayerHand() {
  textAlign(CENTER);
  fill(255, 255, 255);
  textSize(20);
  text("Player Hand", 500, 725);
  textSize(17);
  for (int i = 0; i < round.getPlayer().getHand().size(); i++) {
    //text(round.getPlayer().getHand().get(i).toString(), 300 + i * 100, 850);
    image(round.getPlayer().getHand().get(i).getImage(), 250 + i * 60, 750, 150, 217);
  }
  text("Score: " + round.getPlayer().getScore(), 710, 725);
}

void displayDealerHand() {
  textAlign(CENTER);
  fill(255, 255, 255);
  textSize(20);
  text("Dealer Hand", 500, 25);
  textSize(17);
  for (int i = 0; i < round.getDealer().getHand().size(); i++) {
    if (i == 0 && round.getActive()) {
      //text("HIDDEN\nCARD", 300, 150);
      image(backCard, 250 + i * 60, 50, 150, 217);
    }
    else {
      //text(round.getDealer().getHand().get(i).toString(), 300 + i * 100, 150);
      image(round.getDealer().getHand().get(i).getImage(), 250 + i * 60, 50, 150, 217);
    }
  }
  if (!round.getActive()) {
    text("Score: " + round.getDealer().getScore(), 710, 25);
  }
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {//method from processing documentation (not my own code)

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}

void controlEvent(ControlEvent theEvent) {
   if (theEvent.isFrom(hit) && round.getActive() && !round.preround()) {
     round.playerHit();
   }
   else if (theEvent.isFrom(stand) && round.getActive()) {
    round.playerStand();
   }
   else if (theEvent.isFrom(bet) && round.preround()) {
    round.placeBet(betAmount.getValue());
    round.startRound();
   }
   else if (theEvent.isFrom(newRound)) {
    round.reset();
      betAmount = cp5.addSlider("Bet Amount")
     .setPosition(915, 730)
     .setSize(50, 250)
     .setRange(0, round.getPlayer().getBalance()) //slider increments based on balance
     .setValue(10)
     .setNumberOfTickMarks(11)
     .setColorCaptionLabel(color(20, 20, 20))
     .setColorBackground(0)
     ;
   }
   else if (theEvent.isFrom(newGame)) {
    round = new Blackjack();
   }
}
