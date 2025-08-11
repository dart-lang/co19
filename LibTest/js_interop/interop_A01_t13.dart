// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Within an interop type, you can declare several different types
/// of external interop members:
/// - Constructors. When called, constructors with only positional parameters
///   create a new JS object whose constructor is defined by the name of the
///   extension type using `new`.
///
/// @description Check that it is a compile-time error to tear off a primary
/// constructor of a JS interop type.
/// @author sgrekhov22@gmail.com
/// @issue 61286

import 'dart:js_interop';

extension type ET._(JSObject _) implements JSObject {
}

@JS("ET")
extension type ET2(JSObject _) implements JSObject {
}

extension type ET3.p(JSObject _) implements JSObject {
}

main() {
  var c1 = ET._;
//         ^^^^^
// [analyzer] unspecified
// [web] unspecified

  var c2 = ET2.new;
//         ^^^^^^^
// [analyzer] unspecified
// [web] unspecified

  var c3 = ET3.p;
//         ^^^^^
// [analyzer] unspecified
// [web] unspecified
}
