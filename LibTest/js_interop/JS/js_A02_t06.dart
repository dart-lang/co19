// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation on a JavaScript interop declaration.
///
/// This annotation defines a given library, top-level external declaration, or
/// extension type as a JavaScript interop declaration.
///
/// @description Check that it is a compile-time error if an extension type is
/// annotated with `@JS()` but its representation type is not a valid JS interop
/// type.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

@JS()
extension type ET1<T extends JSAny>(T _) implements JSAny {
//                                  ^
// [analyzer] unspecified
// [web] unspecified
}

@JS()
extension type ET2(int _) implements num {
//                 ^^^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(ET1);
  print(ET2);
}
