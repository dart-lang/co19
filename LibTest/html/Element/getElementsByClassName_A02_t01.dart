/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<Node> getElementsByClassName(String name)
 * Returns a list of nodes with the given class name inside this element.
 * W3C: The classes argument is interpreted as a space-separated list of classes.
 * @description Checks that if name is a space separated list of class names,
 * nodes having all specified classes are collected.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var x = new Element.html('''<div class="foo bar">
           <table class="foo"></table>
           <button class="foo bar"></button>
           <span class="bar foo">
             <pre class="foo baz bar"></pre>
           </span>
         </div>''', treeSanitizer: new NullTreeSanitizer());

  var y = x.getElementsByClassName('foo bar');

  Expect.equals(3, y.length);
}
