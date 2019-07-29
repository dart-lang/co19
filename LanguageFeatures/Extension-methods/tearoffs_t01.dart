/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A static extension method can be torn off like an instance method.
 *
 * @description Check that a static extension method can be torn off like an
 * instance method.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";

class C {
  Object val;
  C(this.val);

  String toString() => val.toString();
}

extension ExtendedList on List {
  int foo<T extends C>(T x) => x.toString().length;
}

main() {
  List list = [1, 2, 3];
  int Function(C) func = list.foo;
  Expect.equals(3, func(C([1])));
  Expect.equals(3, func(C("[1]")));
  Expect.equals(13, func(C("Lily was here")));
}
