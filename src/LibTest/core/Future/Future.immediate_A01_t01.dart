/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future.immediate(T value)
 * A future whose value is immediately available.
 * @description Checks that a future created with constructor
 * Future.immediate has a value immediately.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Future f = new Future.immediate(1);
  Expect.isTrue(f.hasValue);
  Expect.equals(1, f.value);

  f = new Future.immediate('');
  Expect.isTrue(f.hasValue);
  Expect.equals('', f.value);

  f = new Future.immediate(null);
  Expect.isTrue(f.hasValue);
  Expect.equals(null, f.value);

  f = new Future.immediate(true);
  Expect.isTrue(f.hasValue);
  Expect.equals(true, f.value);

  f = new Future.immediate(const []);
  Expect.isTrue(f.hasValue);
  Expect.equals(const [], f.value);

  f = new Future.immediate(const {'k1': 1, 'k2': 2});
  Expect.isTrue(f.hasValue);
  Expect.equals(const {'k1': 1, 'k2': 2}, f.value);
}
