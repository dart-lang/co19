// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool instanceOfString( String constructorName )
///
/// Whether this [JSAny?] is an `instanceof` the constructor that is defined by
/// `constructorName`, which is looked up in the `globalContext`.
///
/// If `constructorName` contains '.'s, the name is split into several parts in
/// order to get the constructor. For example, `library1.JSClass` would involve
/// fetching `library1` off of the `globalContext`, and then fetching `JSClass`
/// off of `library1` to get the constructor.
///
/// If `constructorName` is empty or any of the parts or the constructor don't
/// exist, returns `false`.
///
/// @description Checks that `instanceOfString()` returns `true` if this
/// `JSAny?` is is an `instanceof` the constructor that is defined by
/// `constructorName`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

@JS("A")
extension type ET1(JSObject o) implements JSObject {
  external int id;
  external String name;
}

@JS("B")
extension type ET2(JSObject o) implements JSObject {}

main() {
  eval(r'''
    function A(id, name) {
      this.id = id;
      this.name = name;
    }
    function B() {}
    
    globalThis.objA = new A(42, "A form JS");
    globalThis.objB = new B();
  ''');
  ET1 et1 = globalContext["objA"] as ET1;
  Expect.isTrue(et1.instanceOfString("A"));
  Expect.isFalse(et1.instanceOfString("ET1"));

  ET2 et2 = globalContext["objB"] as ET2;
  Expect.isTrue(et2.instanceOfString("B"));
  Expect.isFalse(et2.instanceOfString("ET2"));
}
