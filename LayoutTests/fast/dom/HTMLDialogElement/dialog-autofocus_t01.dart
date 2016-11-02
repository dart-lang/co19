/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests autofocus when a modal dialog is opened.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <button id="outer-button" autofocus></button>
    <dialog id="dialog">
        <button></button>
        <dialog>
            <button autofocus></button>
        </dialog>
        <div>
            <span>
                <button id="autofocus-button" autofocus></button>
            </span>
        </div>
        <button id="another-button" autofocus></button>
    </dialog>
    ''', treeSanitizer: new NullTreeSanitizer());

  debug('Initial active element');
  shouldBe(document.activeElement, document.getElementById("outer-button"));

  DialogElement dialog = document.getElementById('dialog');
  dialog.showModal();

  ButtonElement autofocusButton = document.getElementById('autofocus-button');
  shouldBe(document.activeElement, autofocusButton);

  ButtonElement anotherButton = document.getElementById('another-button');
  anotherButton.focus();
  shouldBe(document.activeElement, anotherButton);

  debug('Test that reattaching does not give focus back to a previously autofocused element.');
  autofocusButton.style.display = 'none';
  document.body.offsetHeight;
  autofocusButton.style.display = 'block';
  document.body.offsetHeight;
  shouldBe(document.activeElement, anotherButton);

  debug('Test that reinserting does not give focus back to a previously autofocused element.');
  var parentNode = autofocusButton.parentNode;
  autofocusButton.remove();
  document.body.offsetHeight;
  parentNode.append(autofocusButton);
  document.body.offsetHeight;
  shouldBe(document.activeElement, anotherButton);

  dialog.close('');
  debug('Test that autofocus runs again when a dialog is reopened.');
  dialog.showModal();
  shouldBe(document.activeElement, autofocusButton);
  dialog.close('');
}
