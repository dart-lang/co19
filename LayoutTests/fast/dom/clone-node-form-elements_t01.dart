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
    <input id="input1" type="text">
    <input id="input2" type="checkbox">
    <div>
    This tests that clone and importNode copies the form element properties that aren't stored in values, such as 'value', and 'checked'. If this test is successful, the text PASS should be shown below.
    </div>
    <pre id="console"></pre>
    ''', treeSanitizer: new NullTreeSanitizer());

  debug(str) {
    var c = document.getElementById('console');
    c.innerHtml += (str + "<br>");
  }

  InputElement input1 = document.getElementById('input1');
  input1.value = 'Test';

  InputElement input1clone = input1.clone(true);
  if (input1clone.value != input1.value) {
    debug('FAILURE: input1clone.value was "' + input1clone.value + '", expected "' + input1.value + '"');
    debug('FAIL');
    return;
  }

  InputElement input1imported = document.importNode(input1, true);
  if (input1imported.value != input1.value) {
    debug('FAILURE: input1imported.value was "' + input1imported.value + '", expected "' + input1.value + '"');
    debug('FAIL');
    return;
  }

  CheckboxInputElement input2 = document.getElementById('input2');
  input2.checked = true;
  CheckboxInputElement input2clone = input2.clone(true);
  if (input2clone.checked != input2.checked) {
    debug('FAILURE: input2clone.checked was "' + input2clone.checked.toString() + '", expected "' + input2.checked.toString() + '"');
    debug('FAIL');
    return;
  }

  InputElement input2imported = document.importNode(input2, true);
  if (input2imported.checked != input2.checked) {
    debug('FAILURE: input2imported.checked was "' + (input2imported.checked as String) + '", expected "' + input2.checked.toString() + '"');
    debug('FAIL');
    return;
  }

  debug('PASS');
}
