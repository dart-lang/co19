// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean hasProperty( JSAny property )
/// Whether or not this JSObject contains the property key property.
///
/// @description Check that this function returns 'true` if this [JSObject] has
/// property `property` and `false` otherwise. Test `null` and `undefined`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../../js_interop/js_utils.dart';

main() {
  eval(r'''
    globalThis.object1 = {
      p1: null,
      p2: undefined
    };
    
    function Foo() {
      this.p1 = null;
      this.p2 = undefined;
    };
    globalThis.object2 = new Foo();
    
    class Bar {
      constructor() {
        this.p1 = null;
        this.p2 = undefined;
      }
    };
    globalThis.object3 = new Bar();
  ''');
  test(globalContext["object1"] as JSObject);
  test(globalContext["object2"] as JSObject);
  test(globalContext["object3"] as JSObject);
}

test(JSObject obj) {
  Expect.isTrue(obj.hasProperty("p1".toJS).toDart);
  Expect.isTrue(obj.hasProperty("p2".toJS).toDart);
}
