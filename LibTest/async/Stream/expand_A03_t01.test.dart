/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<S> expand<S>(Iterable<S> convert(T value))
 * If a broadcast stream is listened to more than once, each subscription will
 * individually call convert and expand the events.
 * @description Checks that [convert] is called once per event per subscription.
 * @author a.semenov@unipro.ru
 */
library expand_A03_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, List<T> expected) {
  Map<T,int> convertLog = new Map();
  asyncStart();
  Stream<T> stream = s.asBroadcastStream().expand(
    (T event) {
      convertLog[event] = 1 + convertLog.putIfAbsent(event, () => 0);
      return [event];
    }
  );
  Future.wait([
    stream.toList(),
    stream.toList(),
    stream.toList()
  ]).then(
    (List<List<T>> results) {
      Expect.equals(3, results.length);
      results.forEach((actual) => Expect.listEquals(expected,actual));
      Expect.equals(expected.length, convertLog.length);
      expected.forEach((e) => Expect.equals(3, convertLog[e]));
      asyncEnd();
    }
  );
}

void test(CreateStreamFunction create) {
    check(create([]), []);
    check(create([1,2,3,4,5]), [1,2,3,4,5]);
    check(create(["a","b","c"]), ["a","b","c"]);
}
