import 'dart:math';
import 'dart:io';

void main() {
  int playerScore = 0;
  int botScore = 0;
  int count = 0;

  print('Alarm:[Welcome, Player..]');
  print('System:[You are now trapped within this Game Dimension..]');
  print('System:[In order to proceed, you must defeat' +
      ' the Bot in a game of ⬜ ✂ ⚫"]');
  print('System:[.....]');
  print('System:[Now, Pick a card to fulfill your destiny..]');

  do {
    String playerCard = getPlayerCard();
    String botCard = getBotCard();

    print("You played $playerCard");
    print("Computer played $botCard");
    print(Winner(playerCard, botCard));

    if (playerCard == botCard) {
      playerScore++;
      botScore++;
      count++;
    } else if (playerCard == "Bato" && botCard == "Gunting") {
      playerScore++;
      count++;
    } else if (playerCard == "Gunting" && botCard == "Papel") {
      playerScore++;
      count++;
    } else if (playerCard == "Papel" && botCard == "Bato") {
      playerScore++;
      count++;
    } else {
      botScore++;
      count++;
    }
  } while (count != 5);

  print("Five Rounds Over!");
  print("Calculating Results...");
  print("Results:");
  print("Player: $playerScore");
  print("Bot: $botScore");

  if (playerScore > botScore) {
    print(
        "Good Game Well Played Player! You we're able to fulfill your destiny! " +
            "You can go home now :>");
  } else if (playerScore == botScore) {
    print(
        "rip. You gotta do better than the bot to get out of this place dear.");
  } else if (playerScore < botScore) {
    print("rip. I guess you're stuck here with me forever. Player");
  }
}

String getBotCard() {
  Random random = new Random();
  int call = random.nextInt(3);

  switch (call) {
    case 0:
      return "Papel";
      break;
    case 1:
      return "Gunting";
      break;
    case 2:
      return "Bato";
      break;
    default:
      break;
  }
}

String getPlayerCard() {
  print('Choose: [1]Papel, [2]Gunting, [3]Bato');
  int card = int.parse(stdin.readLineSync());
  switch (card) {
    case 1:
      return "Papel";
      break;
    case 2:
      return "Gunting";
      break;
    case 3:
      return "Bato";
      break;
    default:
      break;
  }
}

String Winner(String playerCard, String botCard) {
  if (playerCard == botCard) {
    return "Tie";
  } else if (playerCard == "Bato" && botCard == "Gunting") {
    return "You Win!";
  } else if (playerCard == "Scissors" && botCard == "Papel") {
    return "You Win!";
  } else if (playerCard == "Papel" && botCard == "Bato") {
    return "You Win!";
  } else {
    return "Computer Wins!";
  }
}
