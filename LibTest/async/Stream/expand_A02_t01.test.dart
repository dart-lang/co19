/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<S> expand<S>(Iterable<S> convert(T value))
 * The returned stream is a broadcast stream if this stream is.
 *
 * @description Checks that the returned stream is a broadcast stream
 * if source stream is.
 * @author a.semenov@unipro.ru
 */
library expand_A02_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T,S>(Stream<T> stream, Iterable<S> convert(T event)) {
  Expect.equals(stream.isBroadcast, stream.expand(convert).isBroadcast);
}

void test(CreateStreamFunction create) {

  check(create([]), (_) => []);
  check(create([]).asBroadcastStream(), (_) => []);

  check(create([1,2,3,4,5]), (_) => []);
  check(create([1,2,3,4,5]).asBroadcastStream(), (_) => []);

  check(create([]), (e) => [e]);
  check(create([]).asBroadcastStream(), (e) => [e]);

  check(create([1,2,3,4,5]), (e) => [e]);
  check(create([1,2,3,4,5]).asBroadcastStream(), (e) => [e]);

  check(create([1,2,3,4,5]), (e) => [e,e]);
  check(create([1,2,3,4,5]).asBroadcastStream(), (e) => [e,e]);
}
