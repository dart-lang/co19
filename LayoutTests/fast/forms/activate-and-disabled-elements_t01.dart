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
      <form>
          <button id="button" disabled>Disabled button</button>
          <input id="input" type="submit" disabled>
      </form>
      This tests that disabled form elements don't call submit when they receive a DOMActivate event. If this test is successful, the text "SUCCESS" should be shown below.
      ''', treeSanitizer: new NullTreeSanitizer());

  dispatchActivateEvent(target) {
    // Create a DOMActivate event and dispatch it
    var event = new UIEvent('DOMActivate', canBubble: true, cancelable: true,
        view: window, detail: 1);
    target.dispatchEvent(event);                
  }

  var onsubmitCalled;

  FormElement form = document.body.querySelector('form');
  form.onSubmit.listen((_) {onsubmitCalled = true;});

  runTest(_) {
    var button = document.getElementById('button');
    var input = document.getElementById('input');            

    onsubmitCalled = false;

    dispatchActivateEvent(button);
    dispatchActivateEvent(input);

    shouldBeFalse(onsubmitCalled);

    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(runTest);
}
