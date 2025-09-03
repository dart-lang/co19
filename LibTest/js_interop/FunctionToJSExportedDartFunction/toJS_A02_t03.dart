// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSExportedDartFunction get toJS
/// ...
/// If the static type of the [Function] could not be determined or if the
/// static type uses types that are disallowed, the call will fail to compile.
/// See https://dart.dev/interop/js-interop/js-types#requirements-on-external-declarations-and-function-tojs
/// for more details on what types are allowed.
///
/// @description Check that it is a compile-time error if `.toJS` is called on a
/// function with type parameters.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

class A {}

void foo<T>(T t) {}

void bar<T extends A>() {}

void baz<T extends JSNumber>() {}

void qux<T extends num>() {}

class C {
  static void foo<T>(T t) {}

  static void bar<T extends A>() {}

  static void baz<T extends JSNumber>() {}

  static void qux<T extends num>() {}
}

class D {
  void foo<T>(T t) {}

  void bar<T extends A>() {}

  void baz<T extends JSNumber>() {}

  void qux<T extends num>() {}
}

main() {
  foo.toJS;
//    ^^^^
// [analyzer] unspecified
// [web] unspecified
  bar.toJS;
//    ^^^^
// [analyzer] unspecified
// [web] unspecified
  baz.toJS;
//    ^^^^
// [analyzer] unspecified
// [web] unspecified
  qux.toJS;
//    ^^^^
// [analyzer] unspecified
// [web] unspecified
  C.foo.toJS;
//      ^^^^
// [analyzer] unspecified
// [web] unspecified
  C.bar.toJS;
//      ^^^^
// [analyzer] unspecified
// [web] unspecified
  C.baz.toJS;
//      ^^^^
// [analyzer] unspecified
// [web] unspecified
  C.qux.toJS;
//      ^^^^
// [analyzer] unspecified
// [web] unspecified
  D().foo.toJS;
//        ^^^^
// [analyzer] unspecified
// [web] unspecified
  D().bar.toJS;
//        ^^^^
// [analyzer] unspecified
// [web] unspecified
  D().baz.toJS;
//        ^^^^
// [analyzer] unspecified
// [web] unspecified
  D().qux.toJS;
//        ^^^^
// [analyzer] unspecified
// [web] unspecified
}
