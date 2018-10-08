/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream.fromIterable(Iterable<T> data)
 * Creates a single-subscription stream that gets its data from data.
 * @description Checks that created stream returns all the data from Iterable.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  AsyncExpect.data([], new Stream.fromIterable([]));
  AsyncExpect.data([1, 2, 3, null], new Stream.fromIterable([1, 2, 3, null]));
  Iterable data = new Iterable.generate(10, (int index) => index * 2);
  AsyncExpect.data(data.toList(), new Stream.fromIterable(data));
}
