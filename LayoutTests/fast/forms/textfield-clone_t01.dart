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
      <p>There was a bug that the value property of a cloned text input was not updated.</p>
      <div id=container>
      <input id=i1 value="Initial" style>
      <input id=i2 type=search value="Initial" style>
      <!-- ENABLE_INPUT_SPEECH flag doesn't affect the test result -->
      <input id=i3 type=search value="Initial" x-webkit-speech style>
      <input id=i4 type=number value="0" style>
      </div>
      <div id=console></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var clone;
  var container = document.getElementById('container');
  var newValue;

  check(id, value) {
    var original = document.getElementById(id);
    clone = original.clone(false);
    original.replaceWith(clone);
    clone.focus();
    document.execCommand('selectAll', false, '');
    document.execCommand('insertText', false, value);
    newValue = value;
    debug('Check for ' + clone.type + ' type:');
    shouldBe(clone.value, newValue);
  }

  check('i1', 'foo');
  check('i2', 'query');
  check('i3', 'speech');
  check('i4', '13');
  container.innerHtml = '';
}
