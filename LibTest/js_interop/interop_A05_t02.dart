// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Within an interop type, you can declare several different types
/// of external interop members:
/// ...
/// - Operators. There are only two external interop operators allowed in
///   interop types: [] and []=. These are instance members that match the
///   semantics of JS' property accessors.
///
/// @description Check that it is a compile-time error to rename `[]` or `[]=`
/// operator with `@JS()` annotation.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

extension type ET._(JSObject _) implements JSObject {
  external ET();
  @JS()
  external JSAny operator [](String key);
  @JS("name")
  external void operator []=(String key, JSAny value);
//                       ^^^
// [analyzer] unspecified
// [web] unspecified
}

extension type ET2._(JSObject _) implements JSObject {
  external ET2();
  @JS("name")
  external JSAny operator [](String index);
//                        ^^
// [analyzer] unspecified
// [web] unspecified
  @JS("")
  external void operator []=(String index, JSAny value);
}

main() {
  print(ET);
  print(ET2);
}
