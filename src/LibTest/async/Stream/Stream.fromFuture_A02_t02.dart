/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Stream.fromFuture(Future<T> future)
 * When the future completes, the stream will fire one event, either data or error,
 * and then close with a done-event.
 * @description Checks that if the future completes with error, the stream will fire one error event,
 * and then close with a done-event.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyListener extends StreamListener<int> {
  List<bool> seen=[false, false];
  
  void onData(int event) {
    Expect.fail("onError called unexpectedly");
  }
  
  void onError(error){
    Expect.listEquals([false, false], seen, "onError");
    seen[0]=true;
  }
  
  void onDone(){
    Expect.listEquals([true, false], seen, "onDone");
    seen[1]=true;
    asyncEnd();
  }
  
  void check(){
    Expect.listEquals([true, true], seen, "check");
    asyncEnd();
  }
}

check(Future f) {
  Stream s=new Stream.fromFuture(f);
  MyListener l=new MyListener();
  asyncStart();
  l.listenTo(s);
  asyncStart();
  new Timer(durationMs(10), l.check);
}

main() {
  // using immediate sync future
  void throwError(){throw new Error();}
  check(new Future.sync(throwError));
  
  // using immediate future
  check(new Future(throwError));
  
  // using completable future
  Completer completer = new Completer();
  check(completer.future);
  completer.completeError(new Error());
}

