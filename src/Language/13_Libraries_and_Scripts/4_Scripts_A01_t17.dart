/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A script is a library with a top level function main().
 * scriptDefinition:
 *   scriptTag? libraryDefinition
 * ;
 * @description Checks that script is a library and it is possible to import it with a prefix.
 * @author vasya
 * @reviewer rodionov
 * @reviewer msyabro
 */

import "4_Library3.dart" as P;

main() {
  Expect.equals(1, P.func());
}
