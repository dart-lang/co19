/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> handleError(Function onError, {bool test(error)})
 * The returned stream is a broadcast stream if this stream is.
 * @description Checks that broadcast stream is returned if original stream is
 * broadcast.
 * @author a.semenov@unipro.ru
 */
library handleError_A06_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> stream, Function onError(T event), bool test(error)) {
  Expect.equals(stream.isBroadcast, stream.handleError(onError).isBroadcast);
  Expect.equals(stream.isBroadcast, stream.handleError(onError, test:test).isBroadcast);
}

void test(CreateStreamFunction create) {

  check(create([]), (_) => null, (_) => true);
  check(create([]).asBroadcastStream(), (_) => null, (_) => true);

  check(create([1,2,3,4,5]), (_) => null, (_) => true);
  check(create([1,2,3,4,5]).asBroadcastStream(), (_) => null, (_) => true);

  check(create([]), (e) => throw e, (_) => true);
  check(create([]).asBroadcastStream(), (e) => throw e, (_) => true);

  check(create([1,2,3,4,5]), (e) => throw e, (_) => true);
  check(create([1,2,3,4,5]).asBroadcastStream(), (e) => throw e, (_) => true);
}
