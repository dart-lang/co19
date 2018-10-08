/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Change class affecting ::backdrop style
 */
import "dart:html";
import "../../testcommon.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var style = new Element.html('''
      <style>
      .a .b::backdrop { background-color: green; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="t">
          <dialog class="b" id="dialog"><span></span><span></span><span></span></dialog>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic dialog = document.getElementById("dialog");

  dialog.showModal();

  var green = 'rgb(0, 128, 0)';

  shouldNotBe(getComputedStyle(dialog, '::backdrop').backgroundColor, green);

  document.body.offsetLeft;
  document.getElementById("t").className = "a";

  shouldBe(getComputedStyle(dialog, '::backdrop').backgroundColor, green);

  dialog.close('');
}
