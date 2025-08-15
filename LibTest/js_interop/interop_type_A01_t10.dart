// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When interacting with a JS value, you need to provide a Dart type
/// for it. You can do this by either using or declaring an interop type.
/// Interop types are either a "JS type" provided by Dart or an extension type
/// wrapping an interop type.
///
/// @description Check that a JS interop type member may contain `dart:html`
/// types.
/// @author sgrekhov22@gmail.com

import 'dart:html';
import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external ET.fromElement(Element e);
  external factory ET.fromNode(Node n);

  external Element foo();
  external Node bar(Node _);
}

main() {
  eval(r'''
    class ET {
      constructor(v) {
        this.v = v;
      }
      foo() {
        return this.v;
      }
      bar(v) {
        return this.v;
      }
    }
    globalThis.ET = ET;
  ''');
  Element e1 = DivElement();
  e1.id = "e1";
  ET et1 = ET.fromElement(e1);
  Expect.equals("e1", et1.foo().id);
  var e2 = et1.bar(e1) as Element;
  Expect.equals("e1", e2.id);

  Node n = DivElement();
  n.text = "n";
  ET et2 = ET.fromNode(n);
  Expect.equals("n", et2.foo().text);
}
