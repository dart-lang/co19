// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Invoking an abstract method, getter or setter results in an
/// invocation of noSuchMethod exactly as if the declaration did not exist,
/// unless a suitable member a is available in a superclass, in which case a is
/// invoked.
/// @description Checks that invoking an abstract method, getter or setter
/// results in a compile error.
/// @author kaigorodov, sgrekhov@unipro.ru

class C {
  void m();
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int get g;
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  set g(int v);
//^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C();
}
