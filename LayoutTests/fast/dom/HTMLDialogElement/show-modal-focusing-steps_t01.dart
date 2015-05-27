/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests focus when a modal dialog is opened.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <button id="outer-button" autofocus></button>
    <dialog id="outer-dialog">
        <dialog id="dialog" tabindex=0>
            <button disabled></button>
            <dialog>
                <button autofocus></button>
            </dialog>
            <button id="first-button"></button>
            <div>
                <span>
                    <button id="autofocus-button" autofocus></button>
                </span>
            </div>
            <button id="final-button"></button>
        </dialog>
    </dialog>
    ''', treeSanitizer: new NullTreeSanitizer());

  var outerButton = document.getElementById('outer-button');
  shouldBe(document.activeElement, outerButton);

  debug('Test that focus goes to body if the dialog has no focusable elements, including itself');
  var outerDialog = document.getElementById('outer-dialog');
  outerDialog.showModal();
  shouldBe(document.activeElement, document.body);

  debug('Test that an autofocus element in the dialog gets focus.');
  var dialog = document.getElementById('dialog');
  dialog.showModal();
  var autofocusButton = document.getElementById('autofocus-button');
  shouldBe(document.activeElement, autofocusButton);
  dialog.close('');

  debug('... or else first focusable element in the dialog gets focus.');
  autofocusButton.remove();
  dialog.showModal();
  var firstButton = document.getElementById('first-button');
  shouldBe(document.activeElement, firstButton);
  dialog.close('');

  debug('... or else the dialog itself gets focus.');
  var buttons = dialog.querySelectorAll('button');
  for (var i = 0; i < buttons.length; ++i)
    buttons[i].hidden = true;
  dialog.showModal();
  shouldBe(document.activeElement, dialog);
  dialog.close('');

  document.getElementById('outer-dialog').close('');
}
