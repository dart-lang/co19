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
/// @description Checks it is a compile-time error if an enum is annotated with
/// `@staticInterop` but has no `@JS()` annotation.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

@staticInterop
enum E1 {
//   ^^
// [analyzer] unspecified
// [web] unspecified
  e0;
}

@staticInterop
@JS()
enum E2 {
//   ^^
// [analyzer] unspecified
// [web] unspecified
  e0;
}

main() {
  print(E1);
  print(E2);
}
