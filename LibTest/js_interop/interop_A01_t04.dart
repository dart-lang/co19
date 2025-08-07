// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Within an interop type, you can declare several different types
/// of external interop members:
/// - Constructors. When called, constructors with only positional parameters
///   create a new JS object whose constructor is defined by the name of the
///   extension type using `new`.
///
/// @description Check that it is a compile-time error if a constructor of a
/// JS interop type contains both named and positional parameters.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

extension type ET1._(JSObject _) implements JSObject {
  external ET1.withDescription(int id, String? name, {String description});
//                                 ^^
// [analyzer] unspecified
// [web] unspecified
}

extension type ET2._(JSObject _) implements JSObject {
  external factory ET2(int id, String? name, {String description});
//                         ^^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(ET1);
  print(ET2);
}
