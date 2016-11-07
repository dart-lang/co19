/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p>This test ensures selectstart event fires when selecting all and script can prevent the selection change.</p>
      <section id="test">
      <div contenteditable>hello</div>
      <input type="text" value="world">
      </section>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.onSelectStart.listen((event) => event.preventDefault());

  var handlerOnDivWasCalled = false;
  var div = document.body.querySelector('div');
  div.onSelectStart.listen((event) => handlerOnDivWasCalled = true);
  div.focus();
  window.getSelection().setPosition(div.firstChild, 1);
  document.execCommand('SelectAll', false, null);
  var range = window.getSelection().getRangeAt(0);
  debug('div');
  shouldBeTrue(handlerOnDivWasCalled);
  shouldBeTrue(range.startOffset == 1 && range.endOffset == 1);

  InputElement input = document.body.querySelector('input');
  input.onSelectStart.listen((event) => event.preventDefault());
  input.focus();
  input.selectionStart = 1;
  input.selectionEnd = 1;
  document.execCommand('SelectAll', false, null);
  debug('input');
  shouldBeTrue(input.selectionStart == 1 || input.selectionEnd == 1);
}
