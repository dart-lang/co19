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
/// @description Check that it is a compile-time error if a class annotated with
/// `@JSExport()` contains non-primitive type.
/// @author sgrekhov22@gmail.com
/// @issue 61379

import 'dart:js_interop';

@JSExport()
class C {
  final D d;
//      ^
// [analyzer] unspecified
// [web] unspecified
  C(this.d);
}

@JSExport()
class D {
  int bar() => 42;
}

void main() {
  print(C);
}
