/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Compiling a part directive of the form part s; causes the Dart
 * system to attempt to compile the contents of the URI that is the value of s.
 * The top-level declarations at that URI are then compiled by the Dart compiler
 * in the scope of the current library. It is a compile-time error if the
 * contents of the URI are not a valid part declaration.
 * @description Checks that partDirective, partHeader and libraryName can
 * contain metadata.
 * @author kaigorodov
 */
@Annot()
library Parts_test_lib;
import "../../../Utils/expect.dart";
@Annot1()
part "part_0.dart";
@Annot1.nn(1)
part "part_3.dart";

class Annot1 {
  final int n;
  const Annot1():n=0;
  const Annot1.nn(int this.n);
}

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
