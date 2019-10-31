/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A simple member invocation on a target expression X is an
 * expression of one of the forms:
 * Member invocation on target X	     Corresponding member name
 *        X<types>(args)	                      call
 * @description Check explicit extension member invocation in form of
 * X<types>(args)
 * @author sgrekhov@unipro.ru
 */

class C {
  String call<X, Y>(X x, Y y) => "C:$x:$y";
}

extension Extension1 on C {
}

main() {
  C c = C();
  Extension1(c)<String, int>("Lily was here", 42);
//^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
