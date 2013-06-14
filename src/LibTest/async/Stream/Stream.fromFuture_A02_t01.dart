/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Stream.fromFuture(Future<T> future)
 * When the future completes, the stream will fire one event, either data or error,
 * and then close with a done-event.
 * @description Checks that if the future completes normally, the stream will fire one data event,
 * and then close with a done-event.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

const int value=123;

class MyListener extends StreamListener<int> {
  List<bool> seen=[false, false];
  
  void onData(int event) {
    Expect.listEquals([false, false], seen, "onData");
    seen[0]=true;
    Expect.equals(value, event);
  }
  
  void onError(error){
    throw new Error("onError called unexpectedly");
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
  check(new Future.sync(() => value));
  
  // using immediate future
  check(new Future(() => value));
  
  // using completable future
  Completer completer = new Completer();
  check(completer.future);
  completer.complete(value);
}

