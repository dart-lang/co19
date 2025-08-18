// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When interacting with a JS value, you need to provide a Dart type
/// for it. You can do this by either using or declaring an interop type.
/// Interop types are either a "JS type" provided by Dart or an extension type
/// wrapping an interop type.
///
/// @description Check that it is a compile-time error if a JS interop type
/// member contains a union type with Dart types `void`, `bool`, `num`,
/// `double`, `int` or `String` in its signature.
/// @author sgrekhov22@gmail.com

import "dart:async";
import 'dart:js_interop';

extension type ET._(JSObject _) implements JSObject {
  external ET.fromDart(FutureOr<num> v1);
//                     ^
// [analyzer] unspecified
// [web] unspecified

  external factory ET.fromNum(FutureOr<void> v1);
//                            ^
// [analyzer] unspecified
// [web] unspecified

  external FutureOr<int> v1;
//         ^
// [analyzer] unspecified
// [web] unspecified

  external FutureOr<double> v2;
//         ^
// [analyzer] unspecified
// [web] unspecified

  external FutureOr<bool> foo();
//         ^
// [analyzer] unspecified
// [web] unspecified

  external void bar(FutureOr<String> _);
//                  ^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(ET);
}
