// ****************** Defi ATM *****************
// A Simulated Network of Defi ATMs deployed on the IPC Blockchain

// Author: Hernan Clarke
// Using the Motoko language to develop the canister to be deployed in the blockchain-
// in the front end, I used vanilla HTML and CSS to provide a simple interface to the ATMs.

import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentBalance: Float = 300;
  currentBalance := 300;
  Debug.print(debug_show(currentBalance));

  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show(startTime));

  let id = 2348923840928349;
  // Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentBalance += amount;
    Debug.print(debug_show(currentBalance));
  };

  public func withdraw(amount: Float) {
    let tempValue: Float = currentBalance - amount;
    if (tempValue >= 0) {
      currentBalance -= amount;
      Debug.print(debug_show(currentBalance));
    } else {
      Debug.print("Amount too large, currentValue less than zero.")
    }
  };

  public query func checkBalance(): async Float {
    return currentBalance;
  };

  // topUp();

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentBalance := currentBalance * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };

}















