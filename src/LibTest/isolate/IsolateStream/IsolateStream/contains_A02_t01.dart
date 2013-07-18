/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> contains(T match)
 * Completes the Future when the answer is known.
 * @description Checks that the Future is completed when the answer is known.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(List l, var match, int expected) {
  print("l.length=${l.length}");

  Itereator it=l.iterator;
  MessageBox mbox=new MessageBox();
  Future<bool> fu=mbox.stream.contains(match);
  int count=0;
  bool futureFired=false;
  bool sinkClosed=false;
  
  asyncStart();
  fu.then((actual) {
  print("fu.then");
    Expect.equals(expected, count);
    futureFired=true;
    asyncEnd();
  });

  // sends elements to stream one by one
  void next() {
    if (sinkClosed) {
      Expect.isTrue(futureFired);
  print("sinkClosed");
      return;
    }
    if (it.moveNext()) {
      count++;
      mbox.sink.add(it.current);
  print("moveNext; c=$count v=${it.current}");
    } else {
  print("!moveNext");
      mbox.sink.close();
      sinkClosed=true;
    }
    runLater(next);
  }
  
  asyncStart();
  runLater(next);
}

main() {
//  check([], null, 0);
//  check([1,2,[]], null, 3);
//  check([1,2,null,[]], null, 3);
  check([1,2,[],"z",4], "z", 4);
  check([1,2,null,[]], 2, 2);
}

