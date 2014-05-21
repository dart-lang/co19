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
    <input id="input2" type="checkbox" checked="checked">
    <div>
    This tests that clone and importNode copy the form element properties that aren't stored in values, such as 'value', and 'checked'.
    If this test is successful, the text PASS should be shown below.
    This is a variation on the base test that has the checked attribute already set, which at one point
    caused a crash (see <a href="https://bugs.webkit.org/show_bug.cgi?id=6617">Bugzilla bug 6617</a>).
    </div>
    <pre id="console"></pre>
    ''', treeSanitizer: new NullTreeSanitizer());

  debug(str) {
    var c = document.getElementById('console');
    c.innerHtml += (str + "<br>");
  }

  var input1 = document.getElementById('input1');
  input1.value = 'Test';

  var input1clone = input1.clone(true);
  if (input1clone.value != input1.value) {
    debug('FAILURE: input1clone.value was "' + input1clone.value + '", expected "' + input1.value + '"');
    debug('FAIL');
    return;
  }

  var input1imported = document.importNode(input1, true);
  if (input1imported.value != input1.value) {
    debug('FAILURE: input1imported.value was "' + input1imported.value + '", expected "' + input1.value + '"');
    debug('FAIL');
    return;
  }

  var input2 = document.getElementById('input2');
  input2.checked = true;
  var input2clone = input2.clone(true);
  if (input2clone.checked != input2.checked) {
    debug('FAILURE: input2clone.checked was "' + input2clone.checked + '", expected "' + input2.checked + '"');
    debug('FAIL');
    return;
  }

  var input2imported = document.importNode(input2, true);
  if (input2imported.checked != input2.checked) {
    debug('FAILURE: input2imported.checked was "' + input2imported.checked + '", expected "' + input2.checked + '"');
    debug('FAIL');
    return;
  }

  debug('PASS');
}
