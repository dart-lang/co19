// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
///
/// This annotation defines a given library, top-level external declaration, or
/// extension type as a JavaScript interop declaration.
///
/// @description Check that it is a compile-time error if an old-fashioned
/// function typ is annotated with `@JS()` annotation.
/// @author sgrekhov22@gmail.com
/// @issue 61208

import 'dart:js_interop';

@JS()
typedef void Foo();
//           ^^^
// [analyzer] unspecified
// [web] unspecified

main() {
  print(Foo);
}
