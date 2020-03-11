  part of Expect;

const ONE_MS = const Duration(milliseconds: 1);

typedef CreateStreamFunction = Stream<T> Function<T>(Iterable<T> values);
typedef CreateStreamWithErrorsFunction =
    Stream<T> Function<T>(Iterable<T> values, {bool Function(T element)? isError});

Duration durationMs(delay) {
  return delay == null ? Duration.zero : ONE_MS * delay;
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

class Sync2<T> {
  Function fire;
  bool firstPut = false, secondPut = false;
  T? val1, val2;

  Sync2(this.fire);

  void put1(T val) {
    val1 = val;
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
 *  asyncTest is intended for executing tests with asynchronous nature.
 *  If [setup] is provided, it will be executed first in order to prepare
 * necessary environment for the test (i.e. create some files, start some
 * services, etc). The [setup] may return some value, which will be passed to
 * [test] and to [cleanup].
 *  [test] is main test code. It should return Future instance, which completes
 * when test is over. The future may complete with error, in this case the whole
 * test will fail.
 *   If [cleanup] is provided it will be executed after Future returned by [test]
 * is completed. [cleanup] is always called, regardless of test's status.
 *
 */
void asyncTest<T>(Future test(T? value), {required Future<T> setup(),
    required void cleanup(T? value)}) {
  asyncStart();
  Future<T?> setupFuture = setup();
  setupFuture.then((T? setupValue) {
    test(setupValue)
      .then((_) => asyncEnd())
      .whenComplete(() {
        cleanup(setupValue);
    });
  });
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
  static Future<T> value<T>(T expected, Future<T> future, [String? reason = null]) {
    if (reason == null){
      reason = StackTrace.current.toString();
    }
    asyncStart();
    return future.then((T value){
      if (expected is List) {
        Expect.listEquals(expected, value, reason);
      } else if (expected is Set) {
        Expect.setEquals(expected as Iterable<Object>, value as Iterable<Object>, reason);
      } else {
        Expect.equals(expected, value, reason);
      }
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
  static Future<T> error<T>(Object error, Future<T> future, [String? reason = null]) {
    if (reason == null){
      reason = StackTrace.current.toString();
    }
    asyncStart();
    return future.then(
      (_) {
        Expect.fail("The future is expected to complete with error $reason");
        return future; // return something to make analizer happy (a hint 'no return' otherwise)
      },
      onError: (e){
        if (error is Function){
          Expect.isTrue(Function.apply(error, [e]), reason);
        } else {
          Expect.equals(error, e, reason);
        }
        asyncEnd();
      }
    );
  }

  /**
   * Checks whether the given stream contains expected data events.
   * Any error in the stream is unexpected and wil fail the test.
   */
  static Future<bool> data<T>(List<T> data, Stream<T> stream, [String? reason = null]) {
    if (reason == null){
      reason = StackTrace.current.toString();
    }
    Completer<bool> completer = new Completer<bool>();
    List<T> actual = [];
    asyncStart();
    stream.listen(
        (T value) {
          actual.add(value);
        },
        onDone: () {
          Expect.listEquals(data, actual, reason);
          asyncEnd();
          completer.complete(true);
        }
    );
    return completer.future;
  }

  /**
   * Checks whether the given stream contains expected data and error events.
   */
  static Future<bool> events<T>(List<T> data, List errors, Stream<T> stream, [String? reason = null]) {
    if (reason == null){
      reason = StackTrace.current.toString();
    }
    Completer<bool> completer = new Completer<bool>();
    List<T> actualData = [];
    List actualErrors = [];
    asyncStart();
    stream.listen(
        (T value) {
          actualData.add(value);
        },
        onError: (error) {
          actualErrors.add(error);
        },
        onDone: () {
          Expect.listEquals(data, actualData, reason);
          Expect.listEquals(errors, actualErrors, reason);
          asyncEnd();
          completer.complete(true);
        }
    );
    return completer.future;
  }
}
