/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Range objects should be updated after set innerHTML.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="container">
    <p id="description"></p>
    <div id="sample"><span contenteditable="true">foobar</span></div>
    </div>
    <div id="console"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  $(id) { return document.getElementById(id); }

  var ranges = {};

  eventHandler(event) {
    if (ranges[event.type] != null)
      return;
    ranges[event.type] = document.createRange();
    ranges[event.type].selectNodeContents($('sample').firstChild.firstChild);
  }

  document.body.addEventListener('blur', eventHandler, true);
  document.body.addEventListener('DOMNodeRemovedFromDocument', eventHandler, true);

  ($('sample').firstChild as Element).focus();
  $('sample').innerHtml = '';

  shouldBe(ranges["blur"].startOffset, 0);
  shouldBe(ranges["blur"].endOffset, 0);
  shouldBe(ranges["DOMNodeRemovedFromDocument"].startOffset, 0);
  shouldBe(ranges["DOMNodeRemovedFromDocument"].endOffset, 0);
}
