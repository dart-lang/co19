// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Classes and mixins in the hierarchy of the annotated class are
/// included only if they are annotated as well or specific members in them are
/// annotated. If a superclass does not have an annotation anywhere, its members
/// are not included.
///
/// @description Checks that it is a compile-time error if a mixin is
/// annotated with `@JSExport` but the mixin application class is not and this
/// class is passed to `createJSInteropWrapper` as a type argument.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

@JSExport()
mixin M {
  int aVariable = 42;
  String aMethod(String v) => "aMethod($v);";
  String get aGetter => "aGetter";
  void set aSetter(bool value) {}
}

class C with M {
}

void main() {
  createJSInteropWrapper<C>(C());
//                       ^
// [analyzer] unspecified
// [web] unspecified
}
