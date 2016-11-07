/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that showModal() performs the steps specified in the HTML spec. bug 97425
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <dialog id="mydialog">It's my dialog.</dialog>
    ''', treeSanitizer: new NullTreeSanitizer());

  DialogElement dialog = document.getElementById('mydialog');
  var computedStyle = dialog.getComputedStyle();
  shouldBeEqualToString(computedStyle.getPropertyValue('display'), "none");

  dialog.showModal();
  shouldBeEqualToString(computedStyle.getPropertyValue('display'), "block");

  // The quoted texts output below are from <http://www.whatwg.org/specs/web-apps/current-work/multipage/commands.html#dom-dialog-showmodal>.
  debug('"If dialog already has an open attribute, then throw an InvalidStateError exception."');
  shouldThrow(() {
    dialog.showModal();
  }, (e) => e is DomException && e.name == DomException.INVALID_STATE);

  dialog.close('');
  shouldBeEqualToString(computedStyle.getPropertyValue('display'), "none");

  dialog.remove();
  debug('"If dialog is not in a Document, then throw an InvalidStateError exception."');
  shouldThrow(() {
    dialog.showModal();
  }, (e) => e is DomException && e.name == DomException.INVALID_STATE);


  var doc = document.implementation.createHtmlDocument('');
  doc.body.append(dialog);
  shouldBeFalse(dialog.open);
  dialog.showModal();
  debug('Although the document is not attached to any pages, showModal() should execute as normal.');
  shouldBeTrue(dialog.open);
}
