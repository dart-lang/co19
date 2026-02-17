// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmenting constructors works similar to augmenting a function,
/// with some extra rules to handle features unique to constructors like
/// redirections and initializer lists
///
/// @description Checks that an js interop constructor can be augmented. Test an
/// extension type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

@JS()
extension type ET._(JSObject _) implements JSObject {
  ET.foo(int v);
  external int id;
}


augment extension type ET {
  external ET.new(int v);
  augment external ET.foo(int v);
}

main() {
  eval(r'''
    class ET {
      constructor(vs) {
        this.id = v;
      }
    }
    globalThis.ET = ET;
  ''');
  Expect.equals(1, ET(1).id);
  Expect.equals(2, ET.foo(2).id);
}
