/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Overriding a field which is marked both final and late with a
 * member which does not otherwise introduce a setter introduces an implicit
 * setter which throws.
 *
 * @description Check that overriding a field which is marked both final and
 * late with a member which does not otherwise introduce a setter introduces an
 * implicit setter which throws.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";

class A {
  late final int x;
  late final int? y;
}
class B extends A {
  int get x => 3;
  int? get y => 3;
}
class C extends A {
  late final int x = 3;
  late final int y = 3;
}
void test() {
  Expect.throws(() => new B().x = 3);
  Expect.throws(() => new C().x = 3);
  Expect.throws(() => new B().y = 3);
  Expect.throws(() => new C().y = 3);
}
