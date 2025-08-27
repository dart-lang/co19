// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSAny? operator []( String property )
/// Shorthand helper for [getProperty] to get the value of the property key
/// `property` of this [JSObject], but takes a Dart value.
///
/// @description Check that this operator returns `null` if a property with key
/// `property` does not exist.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../../js_interop/js_utils.dart';

main() {
  eval(r'''
    globalThis.object1 = {
    };
    
    function Foo() {
    };
    globalThis.object2 = new Foo();
    
    class Bar {
      constructor() {
      }
    };
    globalThis.object3 = new Bar();
  ''');
  test(globalContext["object1"] as JSObject);
  test(globalContext["object2"] as JSObject);
  test(globalContext["object3"] as JSObject);
}

test(JSObject obj) {
  Expect.isNull(obj["p0"]);
}
