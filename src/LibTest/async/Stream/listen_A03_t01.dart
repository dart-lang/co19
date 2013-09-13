/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract StreamSubscription<T> listen(void onData(T event), {void onError(error), void onDone(), bool cancelOnError})
 * On errors from this stream, the onError handler is given a object describing the error.
 * @description Checks that the onError handler is given a object describing the error.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(List data) {
  Stream s1=new Stream.fromIterable(data);

  // make a Stream with only error events
  Stream s2=s1.where((var event){
       throw new ArgumentError(event);
    }); 

  List sink=new List();
  asyncStart();
  s2.listen((var event) {
      Expect.fail("unexpected call to onData($event)");
    },
    onError:(Object error) {
       sink.add((error as ArgumentError).message);
    },
    onDone:() {
      Expect.listEquals(data, sink);
      asyncEnd();
    }
  );
}

main() {
  check([]);
  check([1,2,3,4]);
  check([null,"2",-3,4.0, []]);
}
