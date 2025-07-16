// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion `staticInterop` enables the JS annotated class to be treated as
/// a "static" interop class.
///
/// These classes allow interop with native types, like the ones in `dart:html`.
/// These classes should not contain any instance members, inherited or
/// otherwise, and should instead use static extension members.
///
/// @description Checks that it is a compile-time error if an extension type
/// annotated with `@staticInterop` declares external generative constructors.
/// @author sgrekhov22@gmail.com
/// @issue 61124

import 'dart:js_interop';

@staticInterop
@JS()
extension type ET1(JSObject e) {
  external ET1.n(JSObject e);
//         ^^^^^
// [analyzer] unspecified
// [web] unspecified

  external factory ET1.f(JSObject e); // Factory constructors are allowed
}

@staticInterop
@JS()
extension type ET2.n(JSObject e) implements JSObject {
  external ET2(JSObject e);
//         ^^^
// [analyzer] unspecified
// [web] unspecified

  external factory ET2.f(JSObject e);
}

main() {
  print(ET1);
  print(ET2);
}
