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
/// @description Check that it is a compile-time error to declare any other
/// operator in a JS interop type.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

extension type ET._(JSObject _) implements JSObject {
  external JSAny operator +(JSAny other);
//                        ^
// [analyzer] unspecified
// [web] unspecified

  external JSAny operator -(JSAny other);
//                        ^
// [analyzer] unspecified
// [web] unspecified

  external JSAny operator *(JSAny other);
//                        ^
// [analyzer] unspecified
// [web] unspecified

  external JSAny operator /(JSAny other);
//                        ^
// [analyzer] unspecified
// [web] unspecified

  external JSAny operator ~/(JSAny other);
//                        ^^
// [analyzer] unspecified
// [web] unspecified

  external JSAny operator %(JSAny other);
//                        ^
// [analyzer] unspecified
// [web] unspecified

  external JSAny operator <<(JSAny other);
//                        ^^
// [analyzer] unspecified
// [web] unspecified

  external JSAny operator >>(JSAny other);
//                        ^^
// [analyzer] unspecified
// [web] unspecified

  external JSAny operator >>>(JSAny other);
//                        ^^^
// [analyzer] unspecified
// [web] unspecified

  external JSAny operator &(JSAny other);
//                        ^
// [analyzer] unspecified
// [web] unspecified

  external JSAny operator |(JSAny other);
//                        ^
// [analyzer] unspecified
// [web] unspecified

  external JSAny operator ^(JSAny other);
//                        ^
// [analyzer] unspecified
// [web] unspecified

  external JSAny operator >(JSAny other);
//                        ^
// [analyzer] unspecified
// [web] unspecified

  external JSAny operator >=(JSAny other);
//                        ^^
// [analyzer] unspecified
// [web] unspecified

  external JSAny operator <(JSAny other);
//                        ^
// [analyzer] unspecified
// [web] unspecified

  external JSAny operator <=(JSAny other);
//                        ^^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(ET);
}
