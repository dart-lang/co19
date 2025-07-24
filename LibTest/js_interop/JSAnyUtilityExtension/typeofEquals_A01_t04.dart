// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool typeofEquals( String typeString )
/// Whether the result of `typeof` on this `JSAny?` is `typeString`.
///
/// @description Checks that this method returns if the result of JS `typeof` on
/// this `JSAny?` is `typeString`. Test `object`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    function MyObject() {};
    
    class MyClass {
      constructor() {}
    }
    
    const myPrototype = {};
    
    globalThis.o1 = new MyObject();
    globalThis.o2 = new MyClass();
    globalThis.o3 = {};
    globalThis.o4 = Object();
    globalThis.o5 = Object.create(myPrototype);
  ''');
  test(globalContext["o1"]);
  test(globalContext["o2"]);
  test(globalContext["o3"]);
  test(globalContext["o4"]);
  test(globalContext["o5"]);
}

void test(JSAny? value) {
  Expect.isTrue(value.typeofEquals("object"));
  // To check that `typeofEquals` doesn't always return `true`
  Expect.isFalse(value.typeofEquals("string"));
}
