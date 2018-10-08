/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> every(bool test(T element))
 * Checks whether test accepts all elements provided by this stream.
 * Completes the Future when the answer is known.
 * @description Checks that correct answer is passed to the future.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

check(Iterable<int> data, bool test(var element), bool expected) {
  Stream s = IsolateStream.fromIterable(data);
  asyncStart();
  s.every(test).then((bool actual){
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

main() {
  check([], (var element) => true, true);
  check([1, 2, 3], (var element) => element != null, true);
  check([1, 2, 3, null], (var element) => element == null, false);
  check(new Iterable.generate(0, (int index) => index), (var element) => false, true);
  check(new Iterable.generate(10, (int index) => index), (var element) => false, false);
  check(new Iterable.generate(0, (int index) => index), (var element) => true, true);
  check(new Iterable.generate(2, (int index) => index), (var element) => true, true);
  check(new Iterable.generate(10, (int index) => index * 5), (var element) => element == 30, false);
  check(new Iterable.generate(10, (int index) => index * 5), (var element) => element != 30, false);
  check(new Iterable.generate(10, (int index) => index * 5), (var element) => element >= 0, true);
}
