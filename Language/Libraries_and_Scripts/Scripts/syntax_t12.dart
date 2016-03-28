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
 * @description Checks that script is a library and it is possible to import it
 * with a prefix.
 * @author vasya
 * @reviewer rodionov
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

import "library3.dart" as P;

main() {
  Expect.equals(1, P.func());
}
