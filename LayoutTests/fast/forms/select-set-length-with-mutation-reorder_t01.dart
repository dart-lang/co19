/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that setting the .length on an HTMLSelectElement works in
 * the presence of DOM mutation listeners that reorder option elements
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var wrapper = document.createElement('div');
  document.body.append(wrapper);
  wrapper.innerHtml = '<select id="theSelect">' +
    '<option id="a">a</option>' +
    '<option id="b">b</option>' +
    '<option id="c">c</option>' +
    '<option id="d">d</option>' +
    '</select>';

  SelectElement sel = document.getElementById('theSelect') as SelectElement;

  bool firstRemove = true;
  onRemove(e) {
    if (firstRemove) {
      // remove listener temporarily to avoid lots of nesting
      sel.removeEventListener('DOMNodeRemoved', onRemove, false);
      var lastOption = document.getElementById('d');
      lastOption.remove();
      sel.insertBefore(lastOption, document.getElementById('c'));
      firstRemove = false;
      sel.addEventListener('DOMNodeRemoved', onRemove, false);
    }
  }

  sel.addEventListener('DOMNodeRemoved', onRemove, false);
  sel.addEventListener('DOMNodeInserted', (_) {}, false);

  shouldBe(sel.length, 4);
  sel.length = 2;
  shouldBe(sel.length, 2);
  shouldBe(sel.options[0].id, "a");
  shouldBe(sel.options[1].id, "b");
}
