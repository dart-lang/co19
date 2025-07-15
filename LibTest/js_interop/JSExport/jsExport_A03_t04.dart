// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion By default, the property will have the same name as the
/// corresponding instance member. You can change the property name of a member
/// in the JS object by providing a `name` in the `@JSExport` annotation on the
/// member.
///
/// @description Checks that it is a compile-time error if `name` contains any
/// whitespaces.
/// @author sgrekhov22@gmail.com
/// @issue 61096

import 'dart:js_interop';

class C {
  @JSExport("variable 2")
//           ^^^^^^^^^^
// [analyzer] unspecified
// [web] unspecified
  int variable = 42;

  @JSExport("method\n2")
//           ^^^^^^^^^^
// [analyzer] unspecified
// [web] unspecified
  String method(String v) => "method($v);";

  @JSExport("getter\t2")
//           ^^^^^^^^^^
// [analyzer] unspecified
// [web] unspecified
  String get getter => "Some getter";

  @JSExport("setter\r2")
//           ^^^^^^^^^^
// [analyzer] unspecified
// [web] unspecified
  void set setter(bool value) {
  }
}

void main() {
  print(C);
}
