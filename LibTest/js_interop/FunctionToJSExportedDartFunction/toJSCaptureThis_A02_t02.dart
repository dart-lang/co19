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
/// @description Check that it is a compile-time error if the static type of the
/// [Function] uses types that are disallowed.
/// @author sgrekhov22@gmail.com
/// @issue 61439

import 'dart:js_interop';

class C {}

C? foo(JSObject pThis) {return null;}

void bar(JSObject pThis, C c) {}

void baz(JSObject pThis, Map<String, int> s) {}

dynamic qux(JSObject pThis) {}

void quux(JSObject pThis, Symbol s) {}

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
  quux.toJSCaptureThis;
//     ^
// [analyzer] unspecified
// [web] unspecified
}
