// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void setProperty( JSAny property, JSAny? value )
/// Write the value of property key `property` of this [JSObject].
///
/// @description Check that this function writes the value of property key
/// `property` of this [JSObject].
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
  obj.setProperty("p1".toJS, 1.toJS);
  Expect.equals(1, obj.getProperty<JSNumber>("p1".toJS).toDartInt);
  obj.setProperty("p2".toJS, "2".toJS);
  Expect.equals("2", obj.getProperty<JSString>("p2".toJS).toDart);
  obj.setProperty("p3".toJS, null);
  Expect.isNull(obj.getProperty("p3".toJS));
  Expect.isTrue(obj.has("p3"));
}
