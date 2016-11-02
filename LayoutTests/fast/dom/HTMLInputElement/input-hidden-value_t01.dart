/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that the JS property value and the attribute value
 * for a hidden input field are the same.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <form id="frm"><input type="hidden" id="tf" value="Original value"></form>
    ''', treeSanitizer: new NullTreeSanitizer());

  FormElement frm = document.getElementById("frm");
  InputElement tf = document.getElementById('tf');
  tf.setAttribute('value', 'Almost Original Value');
  tf.value = "New value";
  debug('Markup');
  shouldBe(frm.innerHtml, '<input type="hidden" id="tf" value="New value">');
  debug('Value');
  shouldBe(tf.value, 'New value');
  debug('Attribute');
  shouldBe(tf.getAttribute('value'), 'New value'); 
  frm.reset();
  debug('After reset. Markup');
  shouldBe(frm.innerHtml, '<input type="hidden" id="tf" value="New value">');
  debug('After reset. Value');
  shouldBe(tf.value, 'New value');
  debug('After reset. Attribute');
  shouldBe(tf.getAttribute('value'), 'New value'); 
}
