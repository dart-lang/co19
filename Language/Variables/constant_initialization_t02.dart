/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant variable must be initialized to a compile-time 
 * constant or a compile-time error occurs.
 * @description Checks that a compile-time error occurs if a constant variable 
 * is initialized to a non compile-time constant.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */
import "../../Utils/expect.dart";

class Foo {}
const Foo foo = new Foo();

main() {
  try {
    Expect.isTrue(foo is Foo);
  } catch (ok) {}
}
