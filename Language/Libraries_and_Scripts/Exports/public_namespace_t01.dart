/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A library always exports all names and all declarations in its
 * public namespace. In addition, a library may choose to re-export additional
 * libraries via export directives, often referred to simply as exports.
 * @description Checks that all public declarations from an imported library
 * are available to the library that imports it without exception as well as
 * those from the libraries it re-exports (no show/hide combinators used).
 * @author rodionov
 * @reviewer kaigorodov
 */

import "public_namespace_t01_lib.dart";

main() {
  foo();
  int x = bar;
  var b = boo;
  new C();

  foo2();
  x = bar2;
  b = boo2;
  new C2();
}
