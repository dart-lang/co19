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
  var f = new DocumentFragment.html('''
      <style type="text/css">
      br {visibility:hidden}
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>This test ensures WebKit does not lose focus when the text is removed from a text field when br's visibility is hidden.</p>
      <form>
      <fieldset>
      <input id="test" type="text">
      </fieldset>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  InputElement test = document.getElementById('test') as InputElement;
  test.focus();
  document.execCommand('InsertText', false, 'abc');
  document.execCommand('Delete', false, null);
  document.execCommand('Delete', false, null);
  document.execCommand('Delete', false, null);
  document.execCommand('InsertText', false, 'PASS');

  shouldBe(test.value, 'PASS');
}
