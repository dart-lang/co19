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
/// @description Checks that it is a compile-time error if not a type is marked
/// with [anonymous].
/// @author sgrekhov22@gmail.com
/// @issue 61109

import 'dart:js_interop';

@anonymous
void foo() {}
//   ^^^
// [analyzer] unspecified
// [web] unspecified

@anonymous
@JS()
int get bar => 42;
//      ^^^
// [analyzer] unspecified
// [web] unspecified

@anonymous
@JS()
String baz = "baz";
//     ^^^
// [analyzer] unspecified
// [web] unspecified

@anonymous
void set qux(int _) {}
//       ^^^
// [analyzer] unspecified
// [web] unspecified

main() {
   print(foo);
   print(bar);
   print(baz);
}
