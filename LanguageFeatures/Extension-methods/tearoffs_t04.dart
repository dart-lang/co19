/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An explicitly overridden extension method access, like
 * Foo<Bar>(b).baz, also works as a tear-off.
 *
 * @description Check that an explicitly overridden extension method access,
 * like Foo<Bar>(b).baz, also works as a tear-off.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";

extension ExtendedList<T> on List<T> {
  String foo(String x) => "${x}:${this.toString()}";
}

main() {
  List<int> list = [1, 2, 3];
  String Function(String) func = ExtendedList(list).foo;
  Expect.equals("x:${list.toString()}", func("x"));
  Expect.equals("Lily was here:${list.toString()}", func("Lily was here"));
}
