// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Even though you can access this, you cannot use super inside an
/// extension method.
///
/// @description Check that it is a compile error to access super inside an
/// extension method
/// @author sgrekhov@unipro.ru



class A {
  String get a => "a";
}

class C extends A {
  String get c => "c";
}

extension ExtendedC on C {
  String m() => super.a;
//              ^^^^^
// [analyzer] COMPILE_TIME_ERROR.SUPER_IN_EXTENSION
// [cfe] Expected identifier, but got 'super'.
  String get getter => super.a;
//                     ^^^^^
// [analyzer] COMPILE_TIME_ERROR.SUPER_IN_EXTENSION
// [cfe] Expected identifier, but got 'super'.
  String operator-() => super.a;
//                      ^^^^^
// [analyzer] COMPILE_TIME_ERROR.SUPER_IN_EXTENSION
// [cfe] Expected identifier, but got 'super'.
}

main() {
  new C();
}
