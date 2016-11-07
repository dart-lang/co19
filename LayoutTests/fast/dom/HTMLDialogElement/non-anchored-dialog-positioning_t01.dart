/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests positioning of non-anchored dialogs.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
    <style>
    /* Remove body margin and dialog styles to allow comparing dialog's position with that of plain span elements. */
    body {
        margin: 0;
    }

    dialog {
        border: 0;
        padding: 0;
        height: auto;
        width: auto;
    }

    .filler {
        height: 20000px;
    }

    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <dialog id="mydialog">It is my dialog.</dialog>
    <div class="filler" id="fillerDiv"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  checkTopOfViewport(dialog) {
    shouldBe(dialog.getBoundingClientRect().top, 0);
  }

  checkCentered(dialog) {
    var expectedTop = (window.innerHeight - dialog.offsetHeight) / 2;
    shouldBe(dialog.getBoundingClientRect().top, expectedTop);
  }

  // Helper to test both a non-modal and modal dialog.
  showAndTestDialog(dialog, checker) {
    dialog.show();
    checker();
    dialog.close('');

    dialog.showModal();
    checker();
    dialog.close('');
  }

  DialogElement dialog = document.getElementById('mydialog');

  debug('Dialog should be centered in the viewport.');
  showAndTestDialog(dialog, () { checkCentered(dialog); });

  debug('<br>The computed top and bottom of a centered dialog should still have position auto');
  shouldBeEqualToString(dialog.getComputedStyle().top, 'auto');
  shouldBeEqualToString(dialog.getComputedStyle().bottom, 'auto');

  debug('<br>Dialog should be recentered if show() is called after close().');
  window.scroll(0, 500);
  dialog.show();
  checkCentered(dialog);

  debug('<br>Dialog should not be recentered on a relayout.');
  var expectedTop = dialog.getBoundingClientRect().top;
  window.scroll(0, 1000);
  var forceRelayoutDiv = document.createElement('div');
  forceRelayoutDiv.style.width = '100px';
  forceRelayoutDiv.style.height = '100px';
  forceRelayoutDiv.style.border = 'solid';
  document.body.append(forceRelayoutDiv);
  window.scroll(0, 500);
  shouldBe(dialog.getBoundingClientRect().top, expectedTop);
  forceRelayoutDiv.remove();
  dialog.close('');

  debug('<br>A tall dialog should be positioned at the top of the viewport.');
  var dialogInner = document.createElement('div');
  dialogInner.className = 'filler';
  dialog.append(dialogInner);
  showAndTestDialog(dialog, () { checkTopOfViewport(dialog); });
  dialogInner.remove();

  debug('<br>The dialog should be centered regardless of the presence of a horizontal scrollbar.');
  var fillerDiv = document.getElementById('fillerDiv');
  fillerDiv.style.width = '4000px';
  showAndTestDialog(dialog, () { checkCentered(dialog); });
  fillerDiv.style.width = 'auto';

  debug('<br>Test that centering works when dialog is inside positioned containers.');
  var absoluteContainer = document.createElement('div');
  absoluteContainer.style.position = 'absolute';
  absoluteContainer.style.top = '800px;';
  absoluteContainer.style.height = '50px;';
  absoluteContainer.style.width = '90%';
  dialog.remove();
  document.body.append(absoluteContainer);
  absoluteContainer.append(dialog);
  showAndTestDialog(dialog, () { checkCentered(dialog); });
  dialog.remove();

  var relativeContainer = document.createElement('div');
  relativeContainer.style.position = 'relative';
  relativeContainer.style.top = '20px';
  relativeContainer.style.height = '30px';
  absoluteContainer.append(relativeContainer);
  relativeContainer.append(dialog);
  dialog.show();
  checkCentered(dialog);

  debug("<br>Dialog's position should survive after becoming display:none temporarily.");
  expectedTop = dialog.getBoundingClientRect().top;
  window.scroll(0, 1000);
  relativeContainer.style.display = 'none';
  relativeContainer.style.display = 'block';
  window.scroll(0, 500);
  shouldBe(dialog.getBoundingClientRect().top, expectedTop);

  debug("<br>Dialog's position should survive after being re-added to document without another call to show().");
  expectedTop = dialog.getBoundingClientRect().top;
  window.scroll(0, 1000);
  dialog.remove();
  relativeContainer.append(dialog);
  window.scroll(0, 500);
  shouldBe(dialog.getBoundingClientRect().top, expectedTop);
  dialog.close('');

  debug("<br>Dialog's position should survive after close() and show().");
  dialog.show();
  dialog.style.top = '0px';
  expectedTop = dialog.getBoundingClientRect().top;
  dialog.close('');
  dialog.show();
  shouldBe(dialog.getBoundingClientRect().top, expectedTop);
  dialog.style.top = 'auto';

  debug("<br>Dialog's position should survive after close() and manually reopen.");
  dialog.show();
  expectedTop = dialog.getBoundingClientRect().top;
  dialog.close('');
  document.body.offsetHeight;
  dialog.open = true;
  shouldBe(dialog.getBoundingClientRect().top, expectedTop);
  dialog.close('');

  debug("<br>Dialog is recentered if show() is called after removing 'open'");
  dialog.show();
  dialog.attributes.remove('open');
  window.scroll(0, 1000);
  dialog.show();
  checkCentered(dialog);
  dialog.close('');
  window.scroll(0, 500);

  debug("<br>Dialog should not be centered if show() was called when an ancestor had display 'none'.");
  absoluteContainer.style.display = 'none';
  dialog.show();
  absoluteContainer.style.display = 'block';
  // Since dialog's containing block is the ICB, it's statically positioned after <body>.
  expectedTop = document.body.getBoundingClientRect().bottom;
  shouldBe(dialog.getBoundingClientRect().top, expectedTop);
  dialog.close('');

  debug("<br>Test that setting 'top' on dialog results in the same position as for a plain, absolutely positioned span.");
  var plainSpan = document.createElement('span');
  plainSpan.style.position = 'absolute';
  document.body.append(plainSpan);
  plainSpan.style.top = '50px';
  dialog.style.top = '50px';
  expectedTop = plainSpan.getBoundingClientRect().top;
  showAndTestDialog(dialog, () { shouldBe(dialog.getBoundingClientRect().top, expectedTop); });

  debug("<br>Test that setting 'bottom' on dialog results in the same position as for a plain, absolutely positioned span.");
  dialog.style.top = 'auto';
  plainSpan.style.top = 'auto';
  dialog.style.bottom = '50px';
  plainSpan.style.bottom = '50px';
  showAndTestDialog(dialog, () { shouldBe(dialog.getBoundingClientRect().bottom, plainSpan.getBoundingClientRect().bottom); });

  debug('<br>Test that fixed positioning for dialog has same behavior as for a plain span.');
  plainSpan.style.position = 'fixed';
  plainSpan.style.top = '50px';
  dialog.style.position = 'fixed';
  dialog.style.top = '50px';
  showAndTestDialog(dialog, () { shouldBe(dialog.getBoundingClientRect().top, plainSpan.getBoundingClientRect().top); });

  debug('<br>Test that static position for a non-modal dialog has the same behavior as for a plain span.');
  plainSpan.remove();
  relativeContainer.append(plainSpan);
  plainSpan.style.position = 'static';
  expectedTop = plainSpan.getBoundingClientRect().top;
  plainSpan.remove();
  dialog.style.position = 'static';
  // Just test non-modal since modal is covered by other tests (for modal, static computes to absolute)
  dialog.show();
  shouldBe(dialog.getBoundingClientRect().top, expectedTop);
  dialog.close('');

  debug('<br>Test that relative position for a non-modal dialog has the same behavior as for a plain span.');
  relativeContainer.append(plainSpan);
  plainSpan.style.position = 'relative';
  plainSpan.style.top = '50px';
  expectedTop = plainSpan.getBoundingClientRect().top;
  plainSpan.remove();
  dialog.style.position = 'relative';
  dialog.style.top = '50px';
  // Just test non-modal since modal is covered by other tests (for modal, relative computes to absolute)
  dialog.show();
  shouldBe(dialog.getBoundingClientRect().top, expectedTop);
  dialog.close('');
}
