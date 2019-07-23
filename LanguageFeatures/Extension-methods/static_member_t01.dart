/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static member declarations in the extension declaration can be
 * accessed the same way as static members of a class or mixin declaration: By
 * prefixing with the extension's name.
 * @description Check that static member can be accessed by prefixing with the
 * extension's name
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

import "../../Utils/expect.dart";

extension MySmart on Object {
  static int getId() => 128;
  static Object smartHelper(Object o) { return o; }
}

main() {
  Expect.equals(128, MySmart.getId());
  Expect.equals("12345", MySmart.smartHelper("12345"));
}
