// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
///
/// This annotation defines a given library, top-level external declaration, or
/// extension type as a JavaScript interop declaration.
///
/// @description Check that it is a compile-time error if external member of JS
/// interop extension type uses non-valid JS interop type.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

@JS()
extension type ET1<T extends num>(JSObject _) implements JSObject {
  external void f1(T _);
//                 ^
// [analyzer] unspecified
// [web] unspecified
}

extension type ET2<T extends String>(JSObject _) implements JSObject {
  external T g1();
//         ^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(ET1);
  print(ET2);
}
