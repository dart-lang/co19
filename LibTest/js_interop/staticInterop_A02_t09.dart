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
/// annotated with `@staticInterop` declares generative constructors.
/// @author sgrekhov22@gmail.com
/// @issue 61124

import 'dart:js_interop';

@staticInterop
@JS()
extension type ET1(JSObject e) {
  ET1.n(this.e);
//^^^^^
// [analyzer] unspecified
// [web] unspecified

  factory ET1.f(JSObject e) = ET1; // Factory constructors are allowed
}

@staticInterop
@JS()
extension type ET2.n(JSObject e) implements JSObject {
  ET2(this.e);
//^^^
// [analyzer] unspecified
// [web] unspecified

  factory ET2.f(JSObject e) = ET2;
}

main() {
  print(ET1);
  print(ET2);
}
