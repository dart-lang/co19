/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Like for a class or mixin member declaration, the names of the
 * extension members, both static and instance, are in the lexical scope of the
 * extension member body. That is why MySmart above can invoke the static
 * smartHelper without prefixing it by the extension name. In the same way,
 * instance member declarations (the extension members) are in the lexical scope
 *
 * @description Check that extension static member can be called inside of
 * extension without prefix
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";

class C {
}

extension ExtendedC on C {
  static String st = "Lily was here";
  void test() {
    Expect.equals("Lily was here", st);
  }
}

main() {
  C c = new C();
  c.test();
}
