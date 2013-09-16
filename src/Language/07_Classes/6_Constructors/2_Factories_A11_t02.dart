/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if k is prefixed with the const
 * modifier but k' is not a constant constructor.
 * @description Checks that it is a compile-error if const redirecting
 * factory constructor redirects to non-const redirecting factory constructor
 * @compile-error
 * @author ilya
 */

class F1 {
  const factory F1() = F2;
}

class F2 {
  factory F2() = C;
}

class C implements F2 {
}

main() {
  new F1();
}
