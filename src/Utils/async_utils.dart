library async_utils;

import "dart:async";
import "expect.dart";

const ONE_MS = const Duration(milliseconds: 1);

Duration durationMs(delay) {
  return delay == null? Duration.ZERO : ONE_MS * delay;
}

Future runLater(void action()) {
  asyncStart();
  return new Future.delayed(Duration.ZERO, (){
    action();
    asyncEnd();
  });
}
  
/*----------------------------*/

/**
 * Let the test driver know the test is asynchronous and
 * continues after the method main() exits.  
 * see co19 issue #423
 * http://code.google.com/p/co19/issues/detail?id=423
 */

int _asyncTestStart() {
  print("unittest-suite-wait-for-done");
  return 0;
}

int _asyncCounter=_asyncTestStart();

void  asyncStart() {
  _asyncCounter++;
//  print("asyncStart");
}

void  asyncMultiStart(int delta) {
//  print("asyncMultiStart $delta");
  _asyncCounter+=delta;
}

void  asyncEnd() {
//  print("asyncEnd");
  Expect.isFalse(_asyncCounter==0, "asyncEnd: _asyncCounter==0");
  _asyncCounter--;
  if (_asyncCounter==0) {
    print("unittest-suite-success");
  }
}

/*----------------------------*/

abstract class StreamListener<T> {
  void onData(T event);

  void onError(error){}

  void onDone(){}

  bool cancelOnError=false;

  StreamSubscription<T> subscription;

  StreamSubscription<T> listenTo(Stream<T> stream) {
    if (subscription!=null) {
       subscription.cancel();
    }
    subscription=stream.listen(onData, onError:onError, onDone:onDone, cancelOnError:cancelOnError);
    return subscription;
  }
}

/*----------------------------*/

class Sync2<T> {
  Function fire;
  bool firstPut=false, secondPut=false;
  T val1, val2;
  
  Sync2(this.fire);
  
  void put1(T val) {
    val1=val;
    firstPut=true;
    if (secondPut) {
      fire(val1, val2);
    }
  }
  
  void put2(T val) {
    val2=val;
    secondPut=true;
    if (firstPut) {
      fire(val1, val2);
    }
  }
}
/*----------------------------*/
