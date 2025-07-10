// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Only concrete instance members can and will be wrapped, and it's
/// an error to annotate other members with this annotation.
///
/// @description Checks that it is a compile-time error if a static member is
/// annotated with `@JSExport()`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

class C1 {
  @JSExport()
  static int variable = 42;
//           ^^^^^^^^
// [analyzer] unspecified
// [web] unspecified
  @JSExport()
  static String method(String v) => "method($v);";
//              ^^^^^^
// [analyzer] unspecified
// [web] unspecified
  @JSExport()
  static String get getter => "Some getter";
//                 ^^^^^^^
// [analyzer] unspecified
// [web] unspecified

  @JSExport()
  static void set setter(bool value) {}
//                ^^^^^^
// [analyzer] unspecified
// [web] unspecified
}

@JSExport()
class C2 {
//    ^^
// [analyzer] unspecified
// [web] unspecified

  @JSExport()
  static int variable = 42;
//           ^^^^^^^^
// [analyzer] unspecified
// [web] unspecified
  @JSExport()
  static String method(String v) => "method($v);";
//              ^^^^^^
// [analyzer] unspecified
// [web] unspecified
  @JSExport()
  static String get getter => "Some getter";
//                 ^^^^^^^
// [analyzer] unspecified
// [web] unspecified

  @JSExport()
  static void set setter(bool value) {}
//                ^^^^^^
// [analyzer] unspecified
// [web] unspecified
}

mixin M1 {
  @JSExport()
  static int variable = 42;
//           ^^^^^^^^
// [analyzer] unspecified
// [web] unspecified
  @JSExport()
  static String method(String v) => "method($v);";
//              ^^^^^^
// [analyzer] unspecified
// [web] unspecified
  @JSExport()
  static String get getter => "Some getter";
//                 ^^^^^^^
// [analyzer] unspecified
// [web] unspecified

  @JSExport()
  static void set setter(bool value) {}
//                ^^^^^^
// [analyzer] unspecified
// [web] unspecified
}

@JSExport()
mixin M2 {
//    ^^
// [analyzer] unspecified
// [web] unspecified

  @JSExport()
  static int variable = 42;
//           ^^^^^^^^
// [analyzer] unspecified
// [web] unspecified
  @JSExport()
  static String method(String v) => "method($v);";
//              ^^^^^^
// [analyzer] unspecified
// [web] unspecified
  @JSExport()
  static String get getter => "Some getter";
//                 ^^^^^^^
// [analyzer] unspecified
// [web] unspecified

  @JSExport()
  static void set setter(bool value) {}
//                ^^^^^^
// [analyzer] unspecified
// [web] unspecified
}

void main() {
  print(C1);
  print(C2);
  print(M1);
  print(M2);
}
