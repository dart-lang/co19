// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When interacting with a JS value, you need to provide a Dart type
/// for it. You can do this by either using or declaring an interop type.
/// Interop types are either a "JS type" provided by Dart or an extension type
/// wrapping an interop type.
///
/// @description Check that it is a compile-time error if a JS interop type
/// member contains Dart [dynamic] or a type parameter with [dynamic] as a bound
/// in its signature.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

extension type ET._(JSObject _) implements JSObject {
  external ET.fromDart(dynamic value);
//                     ^^^^^^^
// [analyzer] unspecified
// [web] unspecified

  external dynamic foo();
//         ^^^^^^^
// [analyzer] unspecified
// [web] unspecified

  external void bar(dynamic _);
//                  ^^^^^^^
// [analyzer] unspecified
// [web] unspecified
}

@JS('ET')
extension type ET2<T extends dynamic>._(JSObject _) implements JSObject {
  external factory ET2.fromDart(T value);
//                              ^
// [analyzer] unspecified
// [web] unspecified

  external T foo();
//         ^
// [analyzer] unspecified
// [web] unspecified

  external void bar(T _);
//                  ^
// [analyzer] unspecified
// [web] unspecified
}

@JS('ET')
extension type ET3._(JSObject _) implements JSObject {
  external ET3.fromDartDynamic(value);
//                             ^^^^^
// [analyzer] unspecified
// [web] unspecified
  external factory ET3.fromDart(value);
//                              ^^^^^
// [analyzer] unspecified
// [web] unspecified

  external foo();
//         ^
// [analyzer] unspecified
// [web] unspecified

  external void bar(_);
//                  ^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(ET);
  print(ET2);
}
