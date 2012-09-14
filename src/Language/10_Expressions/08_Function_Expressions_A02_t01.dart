/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function literal implements the built-in interface Function.
 * @description Checks that a function literal implements interface Function.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Expect.isTrue(() {} is Function);
  Expect.isTrue((int f () => 1) is Function);
  Expect.isTrue((int g(p1, p2) {}) is Function);
  Expect.isTrue((Object o(p1, [int p2]) {}) is Function);
  Expect.isTrue((func() => "") is Function);
}
