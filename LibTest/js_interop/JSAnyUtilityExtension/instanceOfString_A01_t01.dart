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
  Expect.isTrue(globalContext["objA"].instanceOfString("A"));
  Expect.isTrue(globalContext["objB"].instanceOfString("B"));
  Expect.isFalse(globalContext["objA"].instanceOfString("B"));
  Expect.isFalse(globalContext["objB"].instanceOfString("A"));
}
