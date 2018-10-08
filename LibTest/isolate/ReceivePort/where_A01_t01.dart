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
 * @description Checks that all stream events are checked by the test.
 * Checks that the stream sends only the data events that satisfy the test.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

void check(Iterable data, bool test(int element)) {
  Stream s = IsolateStream.fromIterable(data);
  List collected = new List();
  bool _test(element){
    if (test(element)) {
      return true;
    } else {
      collected.add(element);
      return false;
    }
  }
  asyncStart();
  Stream sw = s.where(_test);
  sw.listen((var value){
      Expect.isTrue(test(value));
      collected.add(value);
    },
    onDone:() {
      Expect.setEquals(data, collected);
      asyncEnd();
    }
  );
}

main() {
  check([1,2,3,null], (int element) => element == null);
  check([1,2,3], (int element) => element > 2);
  check(new Iterable.generate(10, (int index) => index * 5), (int element) => element == 30);
}
