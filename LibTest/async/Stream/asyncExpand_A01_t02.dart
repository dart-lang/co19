/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream asyncExpand(Stream convert(T event))
 * Creates a new stream with the events of a stream per original event.
 *
 * If convert returns null, no value is put on the output stream, just as if it
 * returned an empty stream.
 *
 * @description Checks that if convert returns null, no value is put on the
 * output stream.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(List list, Iterable convert(var value), List expected) {
  Stream s1 = new Stream.fromIterable(list);
  Stream _convert(var event) {
    List lc = new List();
    List l = convert(event);
    for (var e in l) {
      lc.add(e);
    }
    return null;//new Stream.fromIterable(lc);
  }
  Stream s2 = s1.asyncExpand(_convert);
  List actual = new List();
  StreamSubscription ss = s2.listen((event) {actual.add(event);});
  asyncStart();
  ss.onDone(() {
    Expect.listEquals(expected, actual, "expected $expected, actual $actual");
    asyncEnd();
  });
}

void checkList(List list) {
  check(list, (var value) => [], []);
  check(list, (var value) => [value], []);//list);
  check(list, (var value) => [value, value], []);
  check(list, (var value) => [value, null], []);
}

main() {
  checkList([]);
  checkList([null]);
  checkList([1, 2, 3]);
}

