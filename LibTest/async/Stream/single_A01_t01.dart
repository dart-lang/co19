/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> single
 * Returns the single element.
 * @description Checks that the single element is returned.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

const VAL = 123;

void check(Stream s) {
  asyncStart();
  s.single.then(
    (value) {
      Expect.equals(VAL, value);
      asyncEnd();
    }
  );
}

main() {
  check(new Stream.fromIterable([VAL]));
  check(new Stream.fromIterable(new Iterable.generate(1, (int index) => VAL)));
}
