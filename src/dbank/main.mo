import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
 
 stable var currentValue: Float = 300.0;
 stable var startTime = Time.now();
 Debug.print(debug_show(startTime));


 Debug.print(debug_show(currentValue));

public query func checkBalance(): async Float {
    return currentValue;
};

public func topUp(amount: Float) {
     currentValue += amount;

     Debug.print(debug_show(currentValue));
};

public func withdraw(amount: Float) {

    let tempValue: Float = currentValue - amount;

    if (tempValue >= 0) {
        currentValue -= amount;
        Debug.print(debug_show(currentValue));
    }
    else {
        Debug.print("Amount too large. CUrrent Value less than zero");
    }

};

public func compund() {
    let currentTime = Time.now();
    let timeElapseNS = currentTime - startTime;
    
    let timeElpaseS = timeElapseNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElpaseS));
    startTime := currentTime;
};

}
