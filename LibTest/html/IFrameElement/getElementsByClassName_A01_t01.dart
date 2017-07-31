/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<Node> getElementsByClassName(String name)
 * Returns a list of nodes with the given class name inside this element.
 * @description Checks that nodes with given class are collected. Checks that
 * only child nodes are searched, not this node itself.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  IFrameElement x = new IFrameElement();
  x.append(new Element.html('''<div class="foo">
           <table></table>
           <iframe class="foo"></iframe>
           <span class="bar">
             <pre class="foo"></pre>
           </span>
         </div>''', treeSanitizer: new NullTreeSanitizer()));

  var y = x.getElementsByClassName('foo');

  Expect.equals(3, y.length);

  Expect.isTrue(y[0] is DivElement, "DivElement");
  Expect.isTrue(y[1] is IFrameElement, "IFrameElement");
  Expect.isTrue(y[2] is PreElement, "PreElement");
}
