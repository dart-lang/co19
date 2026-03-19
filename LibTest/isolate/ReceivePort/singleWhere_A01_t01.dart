// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<T> singleWhere(bool test(T element))
/// Finds the single element in this stream matching test.
/// Like lastMatch, except that it is an error if more than one matching element
/// occurs in the stream.
///
/// @description Checks that the single element is returned.
/// @author kaigorodov

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

void check(Iterable data, bool test(element), expected) {
  Stream s = IsolateStream.fromIterable(data);
  asyncStart();
  Future f = s.singleWhere(test);
  f.then((actual) {
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

main() {
  check([1, 2, 3, null], (element) => element == null, null);
  check([1, 2, 3], (element) => element > 2, 3);
  check(Iterable.generate(10, (int index) => index * 5),
      (element) => element == 30, 30);
}
