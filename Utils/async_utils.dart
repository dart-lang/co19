library async_utils;

import "dart:async";
export "dart:async";
import "expect.dart";

const ONE_MS = const Duration(milliseconds: 1);

Duration durationMs(delay) {
  return delay == null ? Duration.ZERO : ONE_MS * delay;
}

Future runLater(void action(), [int delay = 0]) {
  asyncStart();
  return new Future.delayed(durationMs(delay), (){
    action();
    asyncEnd();
  });
}

Future runAfter(Future f, void action()) {
  asyncStart();
  return f.whenComplete((){
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
Completer _completer = new Completer();
Future asyncCompleted = _completer.future;

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
  _asyncCounter += delta;
}

void  asyncEnd() {
//  print("asyncEnd");
  Expect.isFalse(_asyncCounter == 0, "asyncEnd: _asyncCounter==0");
  _asyncCounter--;
  if (_asyncCounter == 0) {
    print("unittest-suite-success");
    _completer.complete(null);
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
    subscription=stream.listen(onData, onError:onError, onDone:onDone,
      cancelOnError:cancelOnError);
    return subscription;
  }
}

/*----------------------------*/

class Sync2<T> {
  Function fire;
  bool firstPut = false, secondPut = false;
  T val1, val2;

  Sync2(this.fire);

  void put1(T val) {
    val1=val;
    firstPut = true;
    if (secondPut) {
      fire(val1, val2);
    }
  }

  void put2(T val) {
    val2 = val;
    secondPut = true;
    if (firstPut) {
      fire(val1, val2);
    }
  }

}
/*----------------------------*/
/**
 * AsyncExpect is intended for async test to ease checking
 * Future completion value and checking Stream content.
 */
class AsyncExpect {

  /**
   * Checks whether the given future completes with expected value.
   * Returns the Future, that may be used for test cleanup via method
   * whenComplete(). If checks are passed, the returned future completes
   * the same way as supplied one. Otherwise, the returned future completes
   * with error.
   */
  static Future value(Object expected, Future future) {
    asyncStart();
    return future.then((value){
      Expect.equals(expected, value);
      asyncEnd();
      return value;
    });
  }

  /**
   * Checks whether the given future completes with expected error.
   * Returns the Future, that may be used for test cleanup via method
   * whenComplete(). If checks are passed, the returned future completes
   * the same way as supplied one. Otherwise, the returned future completes
   * with error.
   */
  static Future error(Object error, Future future) {
    asyncStart();
    return future.then(
      (_) {
        Expect.fail("The future is expceted to complete with error");
      },
      onError: (e){
        Expect.equals(error, e);
        asyncEnd();
        throw e;
      }
    );
  }

  /**
   * Checks whether the given stream contains expected data events.
   * Any error in the stream is unexpected and wil fail the test.
   */
  static void data<T>(List<T> data, Stream<T> stream) {
    List actual = [];
    asyncStart();
    stream.listen(
        (T value) {
          actual.add(value);
        },
        onDone: () {
          Expect.listEquals(data, actual);
          asyncEnd();
        }
    );
  }

  /**
   * Checks whether the given stream contains expected data and error events.
   */
  static void events<T>(List<T> data, List errors, Stream<T> stream) {
    List actualData = [];
    List actualErrors = [];
    asyncStart();
    stream.listen(
        (value) {
          actualData.add(value);
        },
        onError: (error) {
          actualErrors.add(error);
        },
        onDone: () {
          Expect.listEquals(data, actualData);
          Expect.listEquals(errors, actualErrors);
          asyncEnd();
        }
    );
  }

}
