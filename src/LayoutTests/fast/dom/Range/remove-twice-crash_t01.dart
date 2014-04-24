/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="container">
    <div id="sample">foo</div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  $(id) { return document.getElementById(id); }

  var done = false;
  document.addEventListener("DOMNodeRemovedFromDocument", (event) {
    if (done)
      return;
    done = true;
    var beingRemoved = event.target;
    beingRemoved.remove();
  }, true);

  var range = document.createRange();
  range.selectNode($('sample'));

  try {
    $('sample').remove();
  } catch (e) {
    // We get 'NotFoundError'.
  }

  $('container').innerHtml = 'PASS; NOT CRASHED';
}
