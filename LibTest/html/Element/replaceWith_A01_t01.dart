// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Node replaceWith(Node otherNode)
/// Replaces this node with another node.
/// @description Checks expected dom after replace

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  //------
  var x = new Element.html('<div><h1><pre></pre></h1><span></span></div>');
  var oldElem = x.querySelector('h1');
  var newElem1 = new AnchorElement();

  oldElem?.replaceWith(newElem1);
  Expect.equals('<div><a></a><span></span></div>', x.outerHtml,
      'replace subtree with single element');

  //------
  x = new Element.html('<div><a></a><span></span></div>');
  oldElem = x.querySelector('a');
  var newElem2 = new Element.html('<h1><pre></pre></h1>');

  oldElem?.replaceWith(newElem2);
  Expect.equals('<div><h1><pre></pre></h1><span></span></div>', x.outerHtml,
      'replace single element with subtree');
}
