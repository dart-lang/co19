/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This tests elements affected by CSS pseudo class selectors are
 * updated after a dynamic DOM change.
 */
import "dart:html";
import "../../testcommon.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var style = new Element.html('''
      <style type="text/css">
      li:only-child { color: red; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <ul id="list"><li id="orig">Original.</li></ul>
      ''', treeSanitizer: new NullTreeSanitizer());

  makeDynamicChanges() {
    var x = document.createElement('li');
    x.append(new Text('Generated content.'));
    var ul = document.getElementById('list');
    ul.insertBefore(x, ul.firstChild);
  }

  shouldBe(getComputedStyle(document.getElementById("orig")).color, "rgb(255, 0, 0)");
  makeDynamicChanges();
  shouldBe(getComputedStyle(document.getElementById("orig")).color, "rgb(0, 0, 0)");
}
