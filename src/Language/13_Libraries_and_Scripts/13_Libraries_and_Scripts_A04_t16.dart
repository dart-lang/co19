/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion libraryDefinition:
 *   libraryName importOrExport* partDirective* topLevelDefinition*
 * ;
 * @description Checks that it is a compile-error if a top-level definition
 * comes before a part directive.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

import "13_Libraries_and_Scripts_A04_t16_lib.dart";

main() {
  try {
    var someVar = 1;
  } catch(e) {}
}
