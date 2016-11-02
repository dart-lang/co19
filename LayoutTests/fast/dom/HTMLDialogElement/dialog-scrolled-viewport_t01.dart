/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that a dialog's containing block is the initial containing block.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
    <style>
    body {
        margin: 0;
    }

    dialog {
        padding : 0;
    }

    #console {
        position: fixed;
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setAttribute('style', "height: 10000px; width: 10000px");
  document.body.setInnerHtml('''
    <div style="position: absolute; top: 5000px; left: 5000px; width: 20px;">
        <dialog id="dialog" style="top: 1200px; left: 1200px; right: auto; height: 100px; width: 50%; background-color: yellow">
        </dialog>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  //debug('The dialog should be onscreen with a width of 50% of the viewport. It is the child of a ' +
  //    'narrow element positioned off screen, but its containing block is the initial containing ' +
  //    'block, so its position and percent lengths are relative to that.');

  checkPosition(dialog) {
    shouldBe(dialog.offsetParent, null);
    shouldBe(dialog.offsetTop, 1200);
    shouldBe(dialog.offsetLeft, 1200);
    // Since dialog's 'width' is '50%', the expected width is half of the
    // viewport width, but viewport width may be odd. It seems Blink rounds up for
    // percentage lengths, so use Math.ceil here.
    var expectedWidth = (document.documentElement.clientWidth / 2).ceil();
    shouldBe(dialog.clientWidth, expectedWidth);
  }

  debug('test1');
  window.scroll(1000, 1000);
  DialogElement dialog = document.getElementById('dialog');
  dialog.showModal();
  checkPosition(dialog);

  debug('test2');
  dialog.close(null);
  dialog.show();
  checkPosition(dialog);
}
