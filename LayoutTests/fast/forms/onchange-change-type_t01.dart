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
      This tests that onchange is not fired after a form field's type changes.<br>
      <form name="fm">
          <input type="text" id="tf" />
      </form>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  sendText(element, text) {
    var event = new TextEvent('textInput', canBubble: true, cancelable: true,
        view: window, data: text);
    element.dispatchEvent(event);
  }

  test() {
    var tf = document.getElementById('tf');

    var didFireOnChange = false;
    tf.onChange.listen((_) {
      didFireOnChange = true;
    });

    tf.focus();
    sendText(tf, 'input value');
    tf.blur();

    debug('Should fire change event when type does not change.');
    shouldBeTrue(didFireOnChange);

    didFireOnChange = false;
    tf.focus();
    sendText(tf, 'new input value');
    tf.setAttribute('type', 'password');
    tf.blur();

    debug('Should *not* fire change event when type does not change.');
    shouldBeFalse(didFireOnChange);
  }

  test();
}
