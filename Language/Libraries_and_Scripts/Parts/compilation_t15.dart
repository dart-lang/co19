/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * partHeader:
 *   metadata part of identifier (`.' identifier)* `;'
 * ;
 * partDeclaration:
 *   partHeader topLevelDefinition* EOF
 * ;
 * A part header begins with part of followed by the name of the library the
 * part belongs to. A part declaration consists of a part header followed by a
 * sequence of top-level declarations.
 * It is a compile-time error if the contents of the URI are not a
 * valid part declaration. 
 * @description Checks that partHeader and library derectives can contain metadata.
 * @author kaigorodov
 */
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
