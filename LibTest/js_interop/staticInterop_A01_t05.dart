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
/// @description Checks that it is a warning if an extension type is annotated
/// with `@staticInterop`.
/// @author sgrekhov22@gmail.com
/// @issue 61124

import 'dart:js_interop';

@staticInterop
extension type ET1(JSObject o) {}
//             ^^^
// [analyzer] unspecified
// [web] unspecified

@staticInterop
@JS()
extension type ET2(JSObject o) {}
//             ^^^
// [analyzer] unspecified
// [web] unspecified

@staticInterop
extension type ET3(JSObject o) implements JSObject {}
//             ^^^
// [analyzer] unspecified
// [web] unspecified

@staticInterop
@JS()
extension type ET4(JSObject o) implements JSObject {}
//             ^^^
// [analyzer] unspecified
// [web] unspecified

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
}
