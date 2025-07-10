// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Only concrete instance members can and will be wrapped, and it's
/// an error to annotate other members with this annotation.
///
/// @description Checks that it is a compile-time error if a class is not
/// annotated with `@JSExport()`, but its type alias is, and that alias is
/// passed as a type argument to `createJSInteropWrapper`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

class C {
  int variable = 42;
}

@JSExport()
typedef CAlias = C;

void main() {
  createJSInteropWrapper<CAlias>(CAlias());
//                       ^^^^^^
// [analyzer] unspecified
// [web] unspecified
}
