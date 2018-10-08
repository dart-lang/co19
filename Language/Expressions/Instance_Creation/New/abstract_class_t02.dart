/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if q is a constructor of an abstract class
 * and q is not a factory constructor.
 * @description Checks that invoking a non-factory constructor in an abstract
 * class produces a compile error.
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
 */

abstract class C {
  C.id() {}
}

main() {
  new C.id();
}
