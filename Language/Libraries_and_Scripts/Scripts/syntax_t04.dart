class C {}
#! scripts tag    // error

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A script is a library whose exported namespace includes a
 * top-level function main().
 *
 * libraryDefinition:
 *   scriptTag? libraryName? importOrExport* partDirective* topLevelDefinition*
 * ;
 * @description Checks that it is a compile-time error when a top-level
 * definition (a class declaration) comes before the script tag.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  try {
    new C();
  } catch (e) {}
}
