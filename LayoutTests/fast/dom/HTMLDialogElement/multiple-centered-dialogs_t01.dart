/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that multiple dialogs are centered properly. You should
 * see four boxes: one on the top row, two on the middle, and one on the
 * bottom
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
    <style>
    body {
        height: 10000px;
    }

    dialog {
        padding: 0;
        margin: 0;
        height: 50px;
        width: 50px;
    }

    #console {
        position: fixed;
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <dialog id="top-dialog"></dialog>
    <dialog id="first-middle-dialog"></dialog>
    <dialog id="second-middle-dialog" style="left: 100px"></dialog>
    <dialog id="bottom-dialog"></dialog>
    ''', treeSanitizer: new NullTreeSanitizer());

  expectedTop(dialog) {
    return window.scrollY +
      ((document.documentElement.clientHeight - dialog.offsetHeight) / 2).floor();
  }

  showAndTest(id) {
    debug('showing ' + id);
    DialogElement dialog = document.getElementById(id);
    dialog.show();
    shouldBe(dialog.offsetTop, expectedTop(dialog));
  }
  
  showAndTest('top-dialog');

  window.scroll(0, 100);
  showAndTest('first-middle-dialog');
  showAndTest('second-middle-dialog');

  window.scroll(0, 200);
  showAndTest('bottom-dialog');
}
