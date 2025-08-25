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
/// @description Check that it is not an error if a class member has a non-JS
/// interop compatible type but it is not exported.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

class C {
  final D d;
  C(this.d);
  @JSExport()
  String foo() => "foo();";
}

class D {
  int bar() => 42;
}

void main() {
  var jsC = createJSInteropWrapper<C>(C(D()));
  globalContext["jsC"] = jsC;
  eval(r'''
    globalThis.v1 = globalThis.jsC.foo();
    globalThis.v2 = globalThis.jsC.d;
  ''');
  Expect.equals("foo();", (globalContext["v1"] as JSString).toDart);
  Expect.isNull(globalContext["v2"]);
}
