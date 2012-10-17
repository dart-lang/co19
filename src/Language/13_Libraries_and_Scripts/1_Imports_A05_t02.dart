/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is compile-time error to import two different libraries with the same name.
 * @description Checks that it is not an error when a library directly imports
 * two other libraries (A and B) that have different names and A imports and re-exports
 * a third one (C) that has the same name as B.
 * @author rodionov
 */

import "1_Imports_A05_t02_libA.dart";
import "1_Imports_A05_t02_libB.dart";

main() {
  try {
    someVar = 0;
  } catch(e) {}
}
