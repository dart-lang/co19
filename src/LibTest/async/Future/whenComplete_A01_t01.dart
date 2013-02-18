/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future<T> whenComplete(action())
 * Register a function to be called when this future completes.
 * The action function is called when this future completes,
 * whether it does so with a value or with an error.
 * This is the asynchronous equivalent of a "finally" block.
 * @description Checks that the action is called both when this future
 * completes with a value or with an error.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

import "dart:async";

main() {
  int visited = 0;
  void action() {
    visited += 1;
  }

  Completer completer = new Completer();
  completer.future.whenComplete(action);
  completer.complete(20);
  
  Completer completer2 = new Completer();
  Future f2 = completer2.future;
  f2.whenComplete(action).catchError((e){});
  completer2.completeError(22);
  
  new Future.delayed(0, (){
    Expect.equals(2, visited);
  });
}

