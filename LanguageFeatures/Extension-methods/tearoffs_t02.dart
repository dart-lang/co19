/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Torn off extension methods are never equal unless they are
 * identical.
 *
 * @description Check that a static extension method can be torn off like an
 * instance method.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";

extension ExtendedList on List {
  int foo(Object x) => x.toString().length;
}

main() {
  List list = [1, 2, 3];
  int Function(int) func1 = list.foo;
  int Function(int) func2 = list.foo;

  Expect.isFalse(func1 == func2);
  Expect.isTrue(func1 == func1);
}
