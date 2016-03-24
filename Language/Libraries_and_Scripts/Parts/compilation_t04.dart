/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Compiling a part directive of the form part s; causes the Dart
 * system to attempt to compile the contents of the URI that is the value of s.
 * The top-level declarations at that URI are then compiled by the Dart compiler
 * in the scope of the current library. It is a compile-time error if the
 * contents of the URI are not a valid part declaration.
 * @description Checks that more than one part can be included in a library
 * without errors as long as there're no name conflicts.
 * @author rodionov
 * @reviewer kaigorodov
 */
library Parts_test_lib;
import "../../../Utils/expect.dart";
part "part_0.dart";
part "part_3.dart";

main() {
  // get/set
  value = bar;
  Expect.equals(1, value);
  value = false;
  Expect.equals(false, value);
  value = foo;
  Expect.equals("foo", value);
  value = [1,2,3,4];
  Expect.listEquals([1,2,3,4], value);

  // variables
  Expect.isTrue("foo" == foo);
  Expect.isTrue(1 == bar);

  // class
  A a = new A();
  Expect.isTrue(a is A);
}
