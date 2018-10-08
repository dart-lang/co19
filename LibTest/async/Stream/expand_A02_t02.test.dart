/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<S> expand<S>(Iterable<S> convert(T value))
 * The returned stream is a broadcast stream if this stream is.
 * @description Checks that it is several subscriptions are possible for
 * broadcast stream.
 * @author a.semenov@unipro.ru
 */
library expand_A02_t02;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T,S>(Stream<T> s, Iterable<S>convert(T value), List<S> expected) {
  asyncStart();
  Stream<S> stream = s.asBroadcastStream().expand(convert);
  Future.wait([
    stream.toList(),
    stream.toList(),
    stream.toList()
  ]).then(
    (List<List<S>> results) {
      Expect.equals(3, results.length);
      results.forEach((actual) => Expect.listEquals(expected,actual));
      asyncEnd();
    }
  );
}

void test(CreateStreamFunction create) {

    check(create([]), (value) => [], []);
    check(create([]), (value) => [1], []);

    check(create([1,2,3]), (value) => [], []);
    check(create([1,2,3]), (value) => [1], [1,1,1]);
    check(create([1,2,3]), (value) => [value], [1,2,3]);
    check(create([1,2,3]), (v) => [v,v], [1,1,2,2,3,3]);
    check(create([1,2,3]), (v) => [null,v], [null,1,null,2,null,3]);

    check(create([[1,2,3],[4,5]]), (value) => value, [1,2,3,4,5]);
}
