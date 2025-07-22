// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An annotation that indicates a JS annotated class is structural
/// and does not have a known JavaScript prototype.
///
/// A class marked with [anonymous] allows external factories with named
/// parameters. Invoking these factories creates a JavaScript object literal
/// with name-value pairs corresponding to any named parameters and their
/// values. If there are no named parameters, an empty JavaScript object is
/// created.
/// [anonymous] classes have the following restrictions:
///   - They must contain a [JS] annotation, either from this library or from
///     `dart:js_interop`. If the latter, the class must also contain
///     [staticInterop].
///   - They cannot contain any non-external members unless it's a
///     [staticInterop] class, in which case it can also contain non-external
///     factories and static methods.
///   - They cannot contain any external generative constructors.
///   - Any external factory must not contain any positional parameters.
///   - They cannot extend or be extended by a non-[JS] annotated class.
///   - The annotation should only be applied to non-mixin classes and no other
///     declarations.
///
/// @description Checks that it is a warning if an extension type is annotated
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
extension type Ext2.x(JSObject _) {
//             ^^^^
// [analyzer] unspecified
// [web] unspecified

  external factory Ext2({String id});
}

@anonymous
@staticInterop
@JS()
extension type Ext3._(JSObject _) {
//             ^^^^
// [analyzer] unspecified
// [web] unspecified
  external factory Ext3({String id});
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
