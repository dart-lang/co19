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
/// @description Checks that it is a warning if a local declaration is annotated
/// with `@staticInterop`.
/// @author sgrekhov22@gmail.com
/// @issue 61124

import 'dart:js_interop';

main() {
  @staticInterop
  int variable = 42;
//    ^^^^^^^^
// [analyzer] unspecified
// [web] unspecified

  @staticInterop
  String func() => "function";
//       ^^^^
// [analyzer] unspecified
// [web] unspecified
}
