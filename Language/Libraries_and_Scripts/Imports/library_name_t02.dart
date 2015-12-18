/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning to import two different libraries with
 * the same name unless their name is the empty string.
 * @description Checks that it is not an error or warning when a library
 * directly imports two other libraries (A and B) that have different names and
 * A imports and re-exports a third one (C) that has the same name as B.
 * @static-clean
 * @author rodionov
 * @reviewer kaigorodov
 */

import "library_name_t02_libA.dart";
import "library_name_t02_libB.dart";

main() {
  try {
    var someVar = 0;
  } catch (e) {}
}
