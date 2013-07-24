/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Libraries are units of privacy. A private declaration declared within a library
 * L can only be accessed by code within L. Any attempt to access a private member declaration
 * from outside L will cause a run-time error.
 * @description Checks that an attempt to access a private top level variable from outside L 
 * in a top-level function context results in a NoSuchMethodError.
 * @static-warning unresolved identifier in a static context, see "Identifier reference"
 * @author vasya
 * @reviewer msyabro
 * @issue 5839
 */
import "../../Utils/expect.dart";

import "13_Libraries_and_Scripts_A05_t04_lib.dart" as lib;

main() {
  try {
    lib._topLevelDeclaration; /// static-warning unresolved identifier expression in a top-level context (12.30)
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(e) {
  }
}
