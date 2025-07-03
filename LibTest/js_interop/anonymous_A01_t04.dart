// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation that indicates a JS annotated class is structural
/// and does not have a known JavaScript prototype.
///
/// A class marked with [anonymous] must have an unnamed factory constructor
/// with no positional arguments, only named arguments. Invoking the constructor
/// desugars to creating a JavaScript object literal with name-value pairs
/// corresponding to the parameter names and values.
///
/// @description Checks that it is a compile-time error if a mixin is marked
/// with [anonymous].
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

@anonymous
@JS()
mixin M1 {
//    ^^
// [analyzer] unspecified
// [web] unspecified
}

@anonymous
@staticInterop
@JS()
mixin M2 {
//    ^^
// [analyzer] unspecified
// [web] unspecified
}

@anonymous
mixin M3 {
//    ^^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(M1);
  print(M2);
  print(M3);
}
