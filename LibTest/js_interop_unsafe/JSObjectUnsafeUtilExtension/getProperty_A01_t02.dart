// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion R getProperty<R extends JSAny?>( JSAny property )
/// The value of the property key `property` of this [JSObject].
///
/// @description Check that this function returns `null` if a property with key
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
  Expect.isNull(obj.getProperty("p0".toJS));
  Expect.isNull(obj.getProperty(1.toJS));
  Expect.isNull(obj.getProperty(true.toJS));
  Expect.isNull(obj.getProperty(JSArray()));
  Expect.isNull(obj.getProperty(obj));
}
