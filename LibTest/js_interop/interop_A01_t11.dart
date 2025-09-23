// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Within an interop type, you can declare several different types
/// of external interop members:
/// - Constructors. When called, constructors with only positional parameters
///   create a new JS object whose constructor is defined by the name of the
///   extension type using `new`.
///
/// @description Check that it is a warning if an external constructor of JS
/// interop type is annotated with `@JS()` annotation.
/// @author sgrekhov22@gmail.com
/// @issue 61274

import 'dart:js_interop';

extension type ET._(JSObject _) implements JSObject {
  @JS("create")
  external ET(int id, String? name);
//         ^^
// [analyzer] unspecified
// [web] unspecified

  @JS("fromId")
  external ET.f(int id);
//         ^^^^
// [analyzer] unspecified
// [web] unspecified

}

@JS("ET")
extension type ET2._(JSObject _) implements JSObject {
  @JS("")
  external ET2(int id, String? name);
//         ^^^
// [analyzer] unspecified
// [web] unspecified

  @JS(null)
  external ET2.f(int id);
//         ^^^^^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(ET);
  print(ET2);
}
