/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test of createContextualFragment.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="a"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var r = document.createRange();
  var node = document.getElementById("a");
  r.selectNodeContents(node);
  node.append(r.createContextualFragment("<b>SUCCESS</b>"));

  shouldBeNonNull(node.querySelector('b'));
}
