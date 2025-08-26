// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean delete( JSAny property )
/// Deletes the property with key `property` from this [JSObject].
///
/// @description Check that this function returns `true`.
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
  Expect.isTrue(et.delete("p1".toJS).toDart);
  Expect.isTrue(et.delete("p2".toJS).toDart);
  Expect.isTrue(et.delete("p3".toJS).toDart);
}
