/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A simple member invocation on a target expression X is an
 * expression of one of the forms:
 * Member invocation on target X	     Corresponding member name
 *        X(args)	                               call
 * @description Check explicit extension member invocation in form of X(args)
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

class C {
  String call(int index) => "Lily was here:" + index.toString();
}

extension Extension1 on C {
  String operator +(C other) => "Show must go on";
}
main() {
  C c = new C();
  Extension1(c)(42);
//^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
