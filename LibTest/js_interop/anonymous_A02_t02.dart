// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation that indicates a JS annotated class is structural
/// and does not have a known JavaScript prototype.
///
/// A class marked with [anonymous] must have an unnamed factory constructor
/// with no positional arguments, only named arguments. Invoking the constructor
/// desugars to creating a JavaScript object literal with name-value pairs
/// corresponding to the parameter names and values.
///
/// @description Checks that it is a compile-time error if an extension type
/// marked with [anonymous] has unnamed factory constructor with any positional
/// arguments.
/// @author sgrekhov22@gmail.com
/// @issue 61018

import 'dart:js_interop';

@anonymous
@JS()
extension type ET1.x(JSObject _) {
  external factory ET1(JSObject o);
//                              ^
// [analyzer] unspecified
// [web] unspecified
}

@anonymous
@JS()
extension type ET2.x(JSObject _) {
  external factory ET2(JSObject o, {String s});
//                              ^
// [analyzer] unspecified
// [web] unspecified
}

@anonymous
@JS()
extension type ET3.x(JSObject _) {
  external factory ET3([JSObject o]);
//                               ^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
}
