/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A new primitive type Never. This type is denoted by the built-in
 * type declaration Never declared in dart:core.
 *
 * @description Check new primitive type Never. Test type alias
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
import "../../Utils/expect.dart";

class C {}

typedef Neverland = Never;

dynamic test() => Neverland;

main() {
  C c1 = Neverland;
  c1 = test();
  Expect.isTrue(c1 is Never);

  C? c2 = Neverland;
  c2 = test();
  Expect.isTrue(c2 is Never);
}
