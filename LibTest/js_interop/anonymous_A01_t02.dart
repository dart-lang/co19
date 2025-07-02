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
/// @description Checks that it is a warning if an extension type is marked
/// with [anonymous].
/// @author sgrekhov22@gmail.com
/// @issue 61018

import 'dart:js_interop';

@anonymous
@JS()
extension type Ext1(JSObject _) {
//             ^^^^
// [analyzer] unspecified
// [web] unspecified
}

@anonymous
@JS()
extension type Ext2(JSObject _) {
//             ^^^^
// [analyzer] unspecified
// [web] unspecified

  external factory Ext2.f();
}

@anonymous
@JS()
extension type Ext3._(JSObject _) {
//             ^^^^
// [analyzer] unspecified
// [web] unspecified
  external Ext3();
}

@anonymous
extension type Ext4(JSObject id) {
//             ^^^^
// [analyzer] unspecified
// [web] unspecified
}

@anonymous
extension type Ext5.x(JSObject id) {
//             ^^^^
// [analyzer] unspecified
// [web] unspecified
  factory Ext5(JSObject id) = Ext5.x;
}

main() {
  print(Ext1);
  print(Ext2);
  print(Ext3);
  print(Ext4);
  print(Ext5);
}
