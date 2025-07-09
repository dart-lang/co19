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
/// @description Checks that it is a warning when an extension type is annotated
/// with `@JSExport()`.
/// @author sgrekhov22@gmail.com
/// @issue 61082

import 'dart:js_interop';

@JSExport()
class C {
  int variable = 42;
  String method(String v) => "method($v);";
  String get getter => "getter";
  void set setter(bool value) {
  }
}

@JSExport()
extension type ET(C c) implements C {
//             ^^
// [analyzer] unspecified
// [web] unspecified
  String etMethod(String v) => "etMethod($v);";
  String get etGetter => "etGetter";
  void set etSetter(bool value) {
  }
}

void main() {
  print(ET);
}
