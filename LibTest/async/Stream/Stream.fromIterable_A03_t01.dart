/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream.fromIterable(Iterable<T> data)
 * Creates a single-subscription stream that gets its data from data.
 * The iterable is iterated when the stream receives a listener, and stops
 * iterating if the listener cancels the subscription.
 * @description Checks Stream interface methods
 * @author a.semenov@unipro.ru
 */

import "dart:async";
import "allTests_A01.lib.dart";

main() {
  test(<T>(Iterable<T> data) => new Stream<T>.fromIterable(data));
}
