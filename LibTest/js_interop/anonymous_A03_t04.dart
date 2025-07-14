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
/// @description Checks that it is a compile-time error if an extension
/// is annotated with `@anonymous`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

class C1 {
  C1.n({String id = ""});
  factory C1({String id}) = C1.n;
}

@anonymous
@JS()
extension Ext1 on C1 {
//        ^^^^
// [analyzer] unspecified
// [web] unspecified
}

@anonymous
@staticInterop
@JS()
class C2 {
  external factory C2({String id});
}

@anonymous
extension Ext2 on C2 {
//        ^^^^
// [analyzer] unspecified
// [web] unspecified
}

main() {
   print(C1);
   print(C2);
}
