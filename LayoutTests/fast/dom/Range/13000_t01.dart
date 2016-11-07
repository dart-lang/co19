/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests for a bug in Range::createContextualFragment, it 
 * would fail if the range started in a text node.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="div" contenteditable="true">The , jumps over the lazy dog.</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var div = document.getElementById("div");
  var text = div.firstChild;
  var sel = window.getSelection();

  sel.setPosition(text, 4);
  var range = sel.getRangeAt(0);
  var html = "quick brown fox";
  var frag = range.createContextualFragment(html);
  range.insertNode(frag);

  shouldBe(div.text, "The quick brown fox, jumps over the lazy dog.");
}
