/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A getter definition that is prefixed with the static modifier 
 * defines a static getter
 * @description Checks that static getter returns correct value
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class C {
  static int get g1 => 0;
  static get g2 => null;
}

main() {
  Expect.equals(0, C.g1);
  Expect.equals(null, C.g2);
}
