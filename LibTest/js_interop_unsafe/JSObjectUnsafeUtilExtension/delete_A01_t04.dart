// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean delete( JSAny property )
/// Deletes the property with key `property` from this [JSObject].
///
/// @description Check that this function deletes the property with key
/// `property` from this [JSObject]. Test JS interop object.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../../js_interop/js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external ET();
  external int? get p1;
  external String? get p2;
  external JSFunction? get p3;
}

main() {
  eval(r'''    
    class ET {
      constructor() {
        this.p1 = 1;
        this.p2 = "2";
        this.p3 = function() {};
      }
    };
    globalThis.ET = ET;
  ''');
  var et = ET();

  Expect.equals(1, et.p1);
  et.delete("p1".toJS);
  Expect.isNull(et.p1);
  Expect.isFalse(et.has("p1"));

  Expect.equals("2", et.p2);
  et.delete("p2".toJS);
  Expect.isNull(et.p2);
  Expect.isFalse(et.has("p2"));

  Expect.isNotNull(et.p3);
  et.delete("p3".toJS);
  Expect.isNull(et.p3);
  Expect.isFalse(et.has("p3"));
}
