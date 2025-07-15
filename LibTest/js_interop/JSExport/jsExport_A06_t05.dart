// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Only concrete instance members can and will be wrapped, and it's
/// an error to annotate other members with this annotation.
///
/// @description Checks that it is a warning or an error if a type alias is
/// annotated with `@JSExport()`.
/// @author sgrekhov22@gmail.com
/// @issue 61116

import 'dart:js_interop';

String log = "";

@JSExport()
class C {
  int variable = 42;
  String method(String v) => "method($v);";
  String get getter => "Some getter";
  void set setter(bool value) {
    log = "setter($value);";
  }
}

@JSExport()
typedef CAlias = C;
//      ^^^^^^
// [analyzer] unspecified
// [web] unspecified

void main() {
  print(CAlias);
}
