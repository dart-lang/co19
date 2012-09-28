/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A library always exports all names and all declarations in its public namespace. 
 * @description Checks that all public declarations from an imported library are available 
 * to the library that imports it without exception.
 * @author rodionov
 */

import "1_Exports_A01_t01_lib.dart";

main() {
  foo();
  int x = bar;
  var b = boo;
  new C();
}
