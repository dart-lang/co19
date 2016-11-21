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
      <p>This tests cloning an input element with an edited value.
      The cloned input element should retain the edited value and you should see PASS blow.</p>
      <pre id="log"></pre>
      <div><input id="test" title="1" type="text" value="FAIL"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  InputElement test = document.getElementById('test') as InputElement;
  test.value = 'PA';

  int x = test.offsetLeft; // Force layout

  InputElement clone = test.clone(true) as InputElement;
  test.parentNode.append(clone);
  test.value = '';

  clone.focus();
  clone.selectionStart = clone.selectionEnd = clone.value.length;
  document.execCommand('InsertText', false, 'SS');

  document.getElementById('log').text = clone.value;

  shouldBe(document.getElementById('log').text, 'PASS');
}
