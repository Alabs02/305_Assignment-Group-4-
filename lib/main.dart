import 'dart:async';
import 'dart:io';
import 'templates/menu.dart';
// import 'templates/switch.dart';

enum Status { none, running, stopped }

dynamic state = Status.none;

void main() {
  msg("Welcome to CSC 305 Algorithms by <alabson.inc>");
  msg("Enter [0] to EXIT PROGRAM");
  start();
  menu(0, 0);
}

int userInput(String msg) {
  stdout.writeln(msg);
  try {
    return int.parse(stdin.readLineSync());
  } catch (e) {
    print(
        "The value you inserted is not an integer!, please run program again...");
    return 0;
  }
}

void start() {
  state = Status.running;
}

void close() {
  state = Status.stopped;
  msg("Exiting program...");
  Timer(Duration(seconds: 10), exit(0));
}

void msg(String msg) {
  print(msg);
}

void forLoop(List<String> array) {
  for (int i = 0; i < array.length; i++) {
    print("[${i + 1}] => ${array[i]}");
  }
}

void menu(int c, int s) {
  forLoop(menuItems);
  c = userInput("Select the operation you want to perform:");

  while (state == Status.running) {
    switch (c) {
      case 0:
        close();
        break;
      case 1:
        msg("Awesome, you've selected ${menuItems[0]}");
        msg("Enter [0] to go back to MAINMENU");
        forLoop(linearItems);

        s = userInput("Select the operation you want to perform:");
        while (s > 0) {
          switch (s) {
            case 0:
              break;
            case 1:
              msg("Great, you've selected ${linearItems[0]} under ${menuItems[0]}");
              msg("😉 Done...");
              forLoop(linearItems);
              s = userInput("Perform another operation:");
              break;
            case 2:
              msg("Great, you've selected ${linearItems[1]} under ${menuItems[1]}");
              msg("😉 Done...");
              forLoop(linearItems);
              s = userInput("Perform another operation:");
              break;
            case 3:
              msg("Great, you've selected ${linearItems[2]} under ${menuItems[2]}");
              msg("😉 Done...");
              forLoop(linearItems);
              s = userInput("Perform another operation:");
              break;
            default:
              msg("😒 The number you enter does not exits, please try other available options!");
              forLoop(linearItems);
              s = userInput("Please select a valid number:");
              break;
          }
        }
        break;
      case 2:
        msg("Awesome, you've selected ${menuItems[1]}");
        // execute algorithm
        msg("😉 Done...");
        forLoop(menuItems);
        c = userInput("Perform another operation:");
        break;
      case 3:
        msg("Awesome, you've selected ${menuItems[2]}");
        // execute algorithm
        msg("😉 Done...");
        forLoop(menuItems);
        c = userInput("Perform another operation:");
        break;
      case 4:
        msg("Awesome, you've selected ${menuItems[3]}");
        // execute algorithm
        msg("😉 Done...");
        forLoop(menuItems);
        c = userInput("Perform another operation:");
        break;
      // case 5:
      //   msg("Awesome, you've selected ${menuItems[4]}");
      //   forLoop(menuItems);
      //   break;
      default:
        msg("😒 The number you enter does not exits, please try other available options!");
        forLoop(menuItems);
        c = userInput("Please select a valid number:");
        break;
    }
  }
}
