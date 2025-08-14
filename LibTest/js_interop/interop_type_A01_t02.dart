// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When interacting with a JS value, you need to provide a Dart type
/// for it. You can do this by either using or declaring an interop type.
/// Interop types are either a "JS type" provided by Dart or an extension type
/// wrapping an interop type.
///
/// @description Check that it is a compile-time error if a JS interop type
/// member contains in its signature an extension type with Dart [Object] as a
/// representation type.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

extension type ObjectET1(Object o) implements Object {}

extension type ObjectET2(Object o) {}

extension type ET._(JSObject _) implements JSObject {
  external ET.fromDartObject(ObjectET1 value);
//                           ^^^^^^^^^
// [analyzer] unspecified
// [web] unspecified

  external ObjectET1 foo();
//         ^^^^^^^^^
// [analyzer] unspecified
// [web] unspecified

  external void bar(ObjectET1 _);
//                  ^^^^^^^^^
// [analyzer] unspecified
// [web] unspecified
}

@JS('ET')
extension type ET2._(JSObject _) implements JSObject {
  external ET2.fromDartObject(ObjectET2 value);
//                            ^^^^^^^^^
// [analyzer] unspecified
// [web] unspecified

  external ObjectET2 foo();
//         ^^^^^^^^^
// [analyzer] unspecified
// [web] unspecified

  external void bar(ObjectET2 _);
//                  ^^^^^^^^^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(ET);
  print(ET2);
}
