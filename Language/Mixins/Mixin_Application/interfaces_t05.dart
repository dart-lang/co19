/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the mixin application declares support for interfaces, the
 * resulting class implements those interfaces.
 * @description Checks that if the mixin application declares support for
 * interfaces and the resulting class does not implement those interfaces then
 * compile error occurs
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

abstract class I {
  num get g;
}

class S {
}

class M {
}

class C = S with M implements I;

main() {
  C c = null;
  Expect.throws(() {c.g;}, (e) => e is NoSuchMethodError);
}
