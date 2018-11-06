/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A mixin declaration introduces a mixin and an interface, but not a
 * class.
 *
 * @description Checks that a mixin declaration introduces an interface and
 * therefore it cannot be extended.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class C {
  String get g => "C.g";
}

mixin M on C {
  String get g => "M.g";
}

class MA extends M {
  String get g => "MA.g";
}

main() {
  MA m = new MA();
  Expect.equals("MA.g", m.g);
}
