// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion `external` interop methods can only contain positional and
/// optional arguments. This is because JS members only take positional
/// arguments. The one exception is object literal constructors, where they can
/// contain only named arguments.
///
/// Unlike with non-external methods, optional arguments don't get replaced with
/// their default value, but are instead omitted.
///
/// @description Check that it is a compile-time error if an external JS interop
/// method has named parameters.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external ET(int id, String? name);

  external int f1({String v});
//                ^
// [analyzer] unspecified
// [web] unspecified

  external int f2({required String v});
//                ^
// [analyzer] unspecified
// [web] unspecified

  external int f3(int id, {String v});
//                        ^
// [analyzer] unspecified
// [web] unspecified

  external int f4(int id, {required String v});
//                        ^
// [analyzer] unspecified
// [web] unspecified
}

@JS("ET")
extension type ET2._(JSObject _) implements JSObject {
  external factory ET2(int id, String? name);

  @JS("foo")
  external int f1({String v});
//                ^
// [analyzer] unspecified
// [web] unspecified

  @JS()
  external int f2({required String v});
//                ^
// [analyzer] unspecified
// [web] unspecified

  @JS("bar")
  external int f3(int id, {String v});
//                        ^
// [analyzer] unspecified
// [web] unspecified

  @JS()
  external int f4(int id, {required String v});
//                        ^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(ET);
  print(ET2);
}
