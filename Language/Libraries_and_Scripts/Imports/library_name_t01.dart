// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is not a compile-time error to import two different libraries
/// with the same name
/// @description Checks that it is not a compile error when a library directly
/// imports two other libraries that have the same library name.
/// @author rodionov
/// @author sgrekhov@unipro.ru
/// @issue 42481

import "library_name_t01_lib1.dart";  // library duplicate_name;
import "library_name_t01_lib2.dart";  // library duplicate_name;

main() {
  foo == 1;
  bar == 2;
}
