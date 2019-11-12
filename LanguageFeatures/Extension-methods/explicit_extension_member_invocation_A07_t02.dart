/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A simple member invocation on a target expression X is an
 * expression of one of the forms:
 * Member invocation on target X	     Corresponding member name
 *   X.id<types>(args)                                  id
 * @description Check explicit extension member invocation in form of
 * X.id<types>(args)
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

class C {
  String id2<T, Y extends num>(T t, Y val) =>
      "C: t=" + t.toString() + ", i=$val";
}

extension Extension1 on C {
  String id<T, Y extends num>(T t, Y val) =>
      "Extension1: t=" + t.toString() + ", i=$val";
}

main() {
  C c = new C();
  Extension1(c).id2<String, int>("Lily was here", 42);
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
