/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a class C declares a static method
 * named n and has a setter named n =
 * @description Check that static warning is produced if class declares a
 * static method and has setter with the same name
 * @static-warning
 * @author sgrekhov@unipro.ru
 * @issue 23749
 */
import "../../../Utils/expect.dart";

class C {
  static set s1(var value) => {};
  static s1() {
    return 1;
  }

  set s2(var value) => {};
  static s2() {
    return 2;
  }
}

main() {
  Expect.equals(1, C.s1(), "Static method should be called");
}
