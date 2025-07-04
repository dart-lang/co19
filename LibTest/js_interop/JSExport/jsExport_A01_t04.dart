// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Annotation to allow Dart classes to be wrapped with a JS object
/// using `dart:js_interop`'s `createJSInteropWrapper`.
///
/// When an instance of a class annotated with this annotation is passed to
/// `createJSInteropWrapper`, the method returns a JS object that contains a
/// property for each of the class' instance members. When called, these
/// properties forward to the instance's corresponding members.
///
/// @description Checks that it is a compile-time error if a class annotated
/// with `@JSExport()` doesn't contain any instance members.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

@JSExport()
class C1 {
//    ^^
// [analyzer] unspecified
// [web] unspecified
  static int variable = 42;
  static String method(String v) => "method($v);";
  static String get getter => "Some getter";
  static void set setter(bool value) {}
}

@JSExport()
class C2 {
//    ^^
// [analyzer] unspecified
// [web] unspecified
  C2();
  C2.x();
  factory C2.f() = C2.x;
}

void main() {
  print(C1);
  print(C2);
}
