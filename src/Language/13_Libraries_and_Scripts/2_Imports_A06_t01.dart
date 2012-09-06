/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error to import the same URI string more than once 
 * in a single library.
 * @description Checks that it is a compile-time error when a library directly imports
 * the same URI more than once.
 * @compile-error
 * @author rodionov
 */

import "2_Imports_A06_t01_lib.dart";
import "2_Imports_A06_t01_lib.dart";

main() {
  try {
    var x = foo;
  } catch(e) {}
}
