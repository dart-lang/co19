/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant variable must be initialized to a compile-time 
 * constant or a compile-time error occurs.
 * @description Checks that a compile-time error occurs if a constant variable 
 * is not initialized.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */
import "../../Utils/expect.dart";

const foo;

main() {
  try {
    Expect.isNull(foo);
  } catch (ok) {}
}
