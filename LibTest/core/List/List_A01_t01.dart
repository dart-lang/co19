/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory List([int length])
 * Creates a list of the given length.
 * The list is a fixed-length list if length is provided, and an empty growable
 * list if length is omitted.
 * @description Checks that created list contains exactly length elements if
 * length is provided.
 * @author iefremov
 */
import "../../../Utils/expect.dart";

void check(List a, int size) {
  Expect.isTrue(size > 0);

  Expect.isTrue(a.length == size);

  a[size-1] = 1;
  Expect.isTrue(a[size-1] == 1);

  a[0] = 42;
  Expect.isTrue(a[0] == 42);

  a[size>>1] = 6031769;
  Expect.isTrue(a[size>>1] == 6031769);

  Expect.throws(() {a[-1] = 0;}, (e) => e is RangeError);
  Expect.throws(() {a[size] = 0;}, (e) => e is RangeError);
}

main() {
  List a = new List(0);
  Expect.isTrue(a.length == 0);
  Expect.throws(() {a[0] = 1;}, (e) => e is RangeError);

  check(new List(1), 1);
  check(new List(42), 42);
  check(new List(100500), 100500);
}
