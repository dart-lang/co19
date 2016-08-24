/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the arity of the user-declared
 * operator ~ is not 0.
 * @description Checks that no compile-time error is produced if a user-defined
 * operator ~ specifies zero parameters.
 * @author kaigorodov
 */
import "../../../../Utils/expect.dart";

class C {
  bool v;
  C(this.v);
  operator ~() { return !v; }
}

main() {
  Expect.isTrue(~new C(false));
  Expect.isFalse(~new C(true));
}
