/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A script is a library with a top level function main().
 * scriptDefinition:
 * scriptTag? libraryName? import* include* resource* topLevelDefinition*
 * ;
 * @description Checks that script is a library and it is possible to import it with a prefix.
 * @author vasya
 * @reviewer rodionov
 * @reviewer msyabro
 */

#import("3_Library3.dart", prefix: "P");

main() {
  Expect.equals(1, P.func());
}