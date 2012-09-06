/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the compilation unit found at the
 * specified URI is not a library declaration.
 * @description Checks that it is a compile-time error if the URI in an import directive
 * does not denote an existing file.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

import "Nonexistent_library.dart";

main() {
  try {
    var someVar = 0;
  } catch(e) {}
}
