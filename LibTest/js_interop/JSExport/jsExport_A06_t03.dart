// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Only concrete instance members can and will be wrapped, and it's
/// an error to annotate other members with this annotation.
///
/// @description Checks that it is a compile-time error if a global variables,
/// functions, getters or setters are annotated with `JSExport()`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

@JSExport()
int variable = 42;
//  ^^^^^^^^
// [analyzer] unspecified
// [web] unspecified

@JSExport()
void func() {}
//   ^^^^
// [analyzer] unspecified
// [web] unspecified

@JSExport()
int get getter => 42;
//      ^^^^^^
// [analyzer] unspecified
// [web] unspecified

@JSExport()
void set setter(int v) {}
//       ^^^^^^
// [analyzer] unspecified
// [web] unspecified

void main() {
  print(variable);
  print(func);
  print(getter);
}
