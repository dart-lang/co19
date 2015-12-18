/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning to import two different libraries with the
 * same name unless their name is the empty string.
 * @description Checks that it is no static warning if two different libraries
 * with empty string as name are imported
 * @static-clean
 * @author sgrekhov@unipro.ru
 */

import "library_name_t03_lib1.dart";
import "library_name_t03_lib2.dart";

main() {
  foo == 1;
  bar == 2;
}
