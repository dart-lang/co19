/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static member declarations in the extension declaration can be
 * accessed the same way as static members of a class or mixin declaration: By
 * prefixing with the extension's name.
 * @description Check that static member can be accessed by usual way
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

import "../../Utils/expect.dart";

extension MySmart on Object {
  static Object smartHelper(Object o) { return o; }
  smart() => smartHelper(this);
}

main() {
  constant String str = "12345";
  Expect.equals(str, MySmart.smart());
  Expect.equals(str, str.smartHelper(str));
  Expect.equals(str, str.smartHelper(str));
  Expect.equals(str, MySmart(str).smartHelper(str));
}
