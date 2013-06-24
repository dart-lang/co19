/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> where(bool test(T event))
 * Creates a new stream from this stream that discards some data events.
 * The new stream sends the same error and done events as this stream, but it only
 * sends the data events that satisfy the test. 
 * @description Checks that the new stream sends the same error and done events as this stream.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Iterable data, bool test(event)) {
  Stream s = new Stream.fromIterable(data)
    .map( (x) => x%2==0?x:throw new ArgumentError(x) )
    .asBroadcastStream();
  List err1=new List();
  List err2=new List();
  bool err1Done=false;
  bool err2Done=false;
  void checkAllDone() {
    if (err1Done && err2Done) {
      Expect.setEquals(err1, err2);
    }      
  }
  asyncStart();
  s.listen((bool value){},
    onError: (error) {
      err1.add(error);
    },
    onDone:() {
      err1Done=true;
      checkAllDone();
      asyncEnd();
    }
  );
  asyncStart();
  s.where(test).listen((bool value){},
    onError: (error) {
      err2.add(error);
    },
    onDone:() {
      err2Done=true;
      checkAllDone();
      asyncEnd();
    }
  );
}

main() {
  check(new Iterable.generate(10, (int index)=>index),
    (event)=>true
  );
}
