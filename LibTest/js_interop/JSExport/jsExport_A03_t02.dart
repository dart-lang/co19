// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion By default, the property will have the same name as the
/// corresponding instance member. You can change the property name of a member
/// in the JS object by providing a `name` in the `@JSExport` annotation on the
/// member.
///
/// @description Checks that if a class is annotated with  a `@JSExport`
/// annotation with non empty `name`.
/// @author sgrekhov22@gmail.com
/// @issue 61084

import 'dart:js_interop';

@JSExport("D")
class C {
//    ^
// [analyzer] unspecified
// [web] unspecified
  int variable = 42;
  String method(String v) => "method($v);";
  String get getter => "Some getter";
  void set setter(bool value) {}
}

void main() {
  print(C);
}
