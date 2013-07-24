#! scripts tag
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
 * @description Checks that is is a compile-time error when a variable declaration
 * comes before a part directive.
 * @compile-error
 * @author vasya
 * @reviewer msyabro
 */
library Script_A01_t14;
import "../../Utils/expect.dart";
import "4_Library1.dart";

final int script = 1; // error
part "3_Part_0.dart";

main() {
  try {
    Expect.equals(1, script);
  } catch(e) {}
}
