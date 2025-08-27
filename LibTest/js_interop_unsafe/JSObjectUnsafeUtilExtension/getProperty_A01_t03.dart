// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion R getProperty<R extends JSAny?>( JSAny property )
/// The value of the property key `property` of this [JSObject].
///
/// @description Check that it is a run-time error if a returned value is not
/// compatible with `R`.
/// @author sgrekhov22@gmail.com
/// @issue 54179

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../../js_interop/js_utils.dart';

main() {
  eval(r'''
    globalThis.object1 = {
      p1: 1,
      p2: "2",
      p3: function() {}
    };
    
    function Foo() {
      this.p1 = 1;
      this.p2 = "2";
      this.p3 = function() {};
    };
    globalThis.object2 = new Foo();
    
    class Bar {
      constructor() {
        this.p1 = 1;
        this.p2 = "2";
        this.p3 = function() {};
      }
    };
    globalThis.object3 = new Bar();
  ''');
  test(globalContext["object1"] as JSObject);
  test(globalContext["object2"] as JSObject);
  test(globalContext["object3"] as JSObject);
}

test(JSObject obj) {
  Expect.throws(() {
    obj.getProperty<JSString>("p1".toJS).toDart;
  });
  Expect.throws(() {
    obj.getProperty<JSNumber>("p2".toJS).toDartInt;
  });
  Expect.throws(() {
    obj.getProperty<JSNumber>("p3".toJS).toDartDouble;
  });
}
