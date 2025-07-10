// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Only concrete instance members can and will be wrapped, and it's
/// an error to annotate other members with this annotation.
///
/// @description Checks that it is a compile-time error if a local variables or
/// functions are annotated with `JSExport()`.
/// @author sgrekhov22@gmail.com
/// @issue 61093

import 'dart:js_interop';

void main() {
  @JSExport()
  int variable = 42;
//    ^^^^^^^^
// [analyzer] unspecified
// [web] unspecified

  @JSExport()
  void func() {}
//     ^^^^
// [analyzer] unspecified
// [web] unspecified
}
