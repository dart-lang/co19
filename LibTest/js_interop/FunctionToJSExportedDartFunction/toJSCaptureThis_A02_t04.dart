// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSExportedDartFunction get toJSCaptureThis
/// A callable JavaScript function that wraps this [Function] and captures the
/// `this` value when called.
///
/// Identical to `toJS`, except the resulting [JSExportedDartFunction] will pass
/// `this` from JavaScript as the first argument to the converted [Function].
/// Any [Function] that is converted with this member should take in an extra
/// parameter at the beginning of the parameter list to handle this.
///
/// @description Check that it is a compile-time error if `toJSCaptureThis` is
/// called on a function with type parameters.
/// @author sgrekhov22@gmail.com
/// @issue 61439

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
  foo.toJSCaptureThis;
//    ^
// [analyzer] unspecified
// [web] unspecified
  bar.toJSCaptureThis;
//    ^
// [analyzer] unspecified
// [web] unspecified
  baz.toJSCaptureThis;
//    ^
// [analyzer] unspecified
// [web] unspecified
  qux.toJSCaptureThis;
//    ^
// [analyzer] unspecified
// [web] unspecified
  C.foo.toJSCaptureThis;
//      ^
// [analyzer] unspecified
// [web] unspecified
  C.bar.toJSCaptureThis;
//      ^
// [analyzer] unspecified
// [web] unspecified
  C.baz.toJSCaptureThis;
//      ^
// [analyzer] unspecified
// [web] unspecified
  C.qux.toJSCaptureThis;
//      ^
// [analyzer] unspecified
// [web] unspecified
  D().foo.toJSCaptureThis;
//        ^
// [analyzer] unspecified
// [web] unspecified
  D().bar.toJSCaptureThis;
//        ^
// [analyzer] unspecified
// [web] unspecified
  D().baz.toJSCaptureThis;
//        ^
// [analyzer] unspecified
// [web] unspecified
  D().qux.toJSCaptureThis;
//        ^
// [analyzer] unspecified
// [web] unspecified
}
