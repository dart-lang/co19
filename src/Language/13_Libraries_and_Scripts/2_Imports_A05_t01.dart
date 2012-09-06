/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is compile-time error to import two different libraries with the same name.
 * @description Checks that it is a compile-time error when a library directly imports
 * two other libraries that have the same library name.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

import "2_Imports_A05_t01_lib1.dart";
import "2_Imports_A05_t01_lib2.dart";

main() {
  try {
    someVar = 0;
  } catch(e) {}
}
