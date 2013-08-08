/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A ﬁnal variable is a variable whose binding is ﬁxed upon initialization;
 * a ﬁnal variable v will always refer to the same object after v has been initialized.
 * The declaration of a ﬁnal variable must include the modiﬁer ﬁnal.
 * It is a static warning if a ﬁnal instance variable that has been initialized at
 * its point of declaration is also initialized in a constructor.
 * It is a static warning if a ﬁnal instance variable that has been initialized by means
 * of an initializing formal of a constructor is also initialized elsewhere in the same
 * constructor.
 * Attempting to assign to a final variable anywhere except in its declaration or in
 * a constructor header will cause a runtime error to be thrown.
 * @static-warning
 * @description Checks that it is not a compile-time error when a final local variable initialized
 * in its declaration is assigned a new value later in the program. Non-normative text in the spec
 * says it's a NoSuchMethodError and a static warning since there's no setter so that's what's being 
 * expected in this test.
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";

class C {
  void test() {
    final v = 1;
    final bool v2 = true;

    try {
      v = 1; /// static warning
      Expect.fail("NoSuchMethodError expected");
    } on NoSuchMethodError catch(e) {}

    try {
      v = 2; /// static warning
      Expect.fail("NoSuchMethodError expected");
    } on NoSuchMethodError catch(e) {}

    try {
      v2 = true; /// static warning
      Expect.fail("NoSuchMethodError expected");
    } on NoSuchMethodError catch(e) {}

    try {
      v2 = false; /// static warning
      Expect.fail("NoSuchMethodError expected");
    } on NoSuchMethodError catch(e) {}
  }
}

main() {
  new C().test();
}
