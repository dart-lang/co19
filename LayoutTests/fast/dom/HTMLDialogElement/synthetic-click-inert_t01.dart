/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that inert nodes still get programmatic click events
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
    <style>
    dialog {
        /* Don't needlessly span the whole screen. */
        width: 50px;
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <button>Click me</button>
    <div id="div">Click me too</div>
    <dialog></dialog>
    ''', treeSanitizer: new NullTreeSanitizer());

  var dialog = document.querySelector('dialog');
  dialog.showModal();

  var button = document.querySelector('button');
  var div = document.getElementById('div');
  var clicked = null;

  [button, div].forEach((element) {
    element.addEventListener('click', (e) { clicked = element; });
    var expectedElement = element;

    clicked = null;
    debug('Calling click() on ' + element.tagName);
    element.click();
    shouldBe(clicked, expectedElement);

    clicked = null;
    debug('Calling dispatchEvent() on ' + element.tagName);
    element.dispatchEvent(new Event('click'));
    shouldBe(clicked, expectedElement);
  });
}
