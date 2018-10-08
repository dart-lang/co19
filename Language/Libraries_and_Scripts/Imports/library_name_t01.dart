/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error to import two different libraries with
 * the same name unless their name is the empty string.
 * @description Checks that it is a compile error when a library directly
 * imports two other libraries that have the same library name.
 * @compile-error
 * @author rodionov
 * @author sgrekhov@unipro.ru
 */

import "library_name_t01_lib1.dart";
import "library_name_t01_lib2.dart";

main() {
  foo == 1;
  bar == 2;
}
