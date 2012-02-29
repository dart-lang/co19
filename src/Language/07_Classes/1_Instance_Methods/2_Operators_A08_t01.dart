/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the return type of the user-declared operator []= is not void.
 * @description Checks that it is a static warning if the return type of
 * the user-declared operator []= is not void.
 * @static-warning
 * @author msyabro
 * @needsreview Issue 1601
 */

class C {
  int operator[]=(index, value) {}
  operator[](index) {}
}

main() {
  try {
    C c = new C();
    c[0] = null;
  } catch(var e) {}
}
