/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that inert elements do not match the :disabled selector.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
    <style>
    button {
        color: green;
    }

    button:disabled {
        color: red;
    }

    .trigger-style-recalc {
        /* No change, we just need a new style recalculation. */
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setAttribute('style', "color: green");
  document.body.setInnerHtml('''
    <button>The test passes if this is in green.</button>
    <dialog></dialog>
    ''', treeSanitizer: new NullTreeSanitizer());
  
  (document.querySelector('dialog') as DialogElement).showModal();
  ButtonElement button = document.querySelector('button');
  button.classes.add('trigger-style-recalc');
  var color = button.getComputedStyle().getPropertyValue('color');
  shouldBe(color, 'rgb(0, 128, 0)');
}
