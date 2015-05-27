/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning to import two dfferent libraries with the same name.
 * @static-warning
 * @description Checks that it is a static warning when a library directly imports
 * two other libraries that have the same library name.
 * @author rodionov
 * @reviewer kaigorodov
 */

import "1_Imports_A05_t01_lib1.dart";
import "1_Imports_A05_t01_lib2.dart";

main() {
  try {
    foo == 1;
    bar == 2;
  } catch(e) {}
}
