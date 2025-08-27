// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean delete( JSAny property )
/// Deletes the property with key `property` from this [JSObject].
///
/// @description Check that it's not an error if a property with key
/// `property` does not exist.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
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
  obj.delete("p0".toJS);
  obj.delete(42.toJS);
  obj.delete(true.toJS);
  obj.delete(JSArray());
  obj.delete(obj);
}
