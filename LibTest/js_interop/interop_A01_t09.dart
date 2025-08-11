// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Within an interop type, you can declare several different types
/// of external interop members:
/// - Constructors. When called, constructors with only positional parameters
///   create a new JS object whose constructor is defined by the name of the
///   extension type using `new`.
///
/// @description Check that it is a compile-time error to tear-off a constructor
/// of a JS interop type.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

extension type ET._(JSObject _) implements JSObject {
  external ET(int id, String? name);
  external ET.fromId(int id);
}

@JS("ET")
extension type ET2._(JSObject _) implements JSObject {
  external factory ET2(int id, String? name);
  external factory ET2.fromId(int id);
}

main() {
  var etNew = ET.new;
//            ^^^^^^
// [analyzer] unspecified
// [web] unspecified

  var etFromId = ET.fromId;
//               ^^^^^^^^^
// [analyzer] unspecified
// [web] unspecified

  var et2New = ET2.new;
//             ^^^^^^^
// [analyzer] unspecified
// [web] unspecified

  var et2fromId = ET2.fromId;
//                ^^^^^^^^^^
// [analyzer] unspecified
// [web] unspecified
}
