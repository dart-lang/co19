// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool has( String property )
/// Shorthand helper for [hasProperty] to check whether this [JSObject] contains
/// the property key `property`, but takes and returns a Dart value.
///
/// @description Check that this function returns 'true` if this [JSObject] has
/// property `property` and `false` otherwise.
/// @author sgrekhov22@gmail.com

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
  Expect.isTrue(obj.has("p1"));
  Expect.isTrue(obj.has("p2"));
  Expect.isTrue(obj.has("p3"));
  Expect.isFalse(obj.has("p4"));
}
