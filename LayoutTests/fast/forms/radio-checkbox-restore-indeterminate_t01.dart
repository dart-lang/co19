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
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <form>
        <input type="radio" name="test" id="radio1" value="a">A
        <input type="radio" name="test" id="radio2" value="b">B
      </form>

      <form>
        <input type="radio" name="test2" id="radio3" value="a">Intermediate A
        <input type="radio" name="test2" id="radio4" value="b">Intermediate B
      </form>

      <form>
        <input type="checkbox" name="check1" id="check1" value="a">C
        <input type="checkbox" name="check2" id="check2" value="b">D
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  dispatchEvent(target, eventType, offsetX, offsetY) {
    var targetRect = target.getBoundingClientRect();
    var ev = new MouseEvent(eventType, canBubble: true, cancelable: true,
        view: window, detail: 1,
        screenX: 1, screenY: 1,
        clientX: round(targetRect.left) + offsetX, clientY: round(targetRect.top) + offsetY,
        ctrlKey: false, altKey: false, shiftKey: false, metaKey: false,
        button: 0, relatedTarget: document);
    target.dispatchEvent(ev);
  }

  defaultPreventingHandler(e) {
    e.preventDefault();
  }

  runTests() {
    var radio1 = document.getElementById("radio1");
    var radio2 = document.getElementById("radio2");

    var radio3 = document.getElementById("radio3");
    var radio4 = document.getElementById("radio4");

    var check1 = document.getElementById("check1");
    var check2 = document.getElementById("check2");

    radio1.checked = true;

    radio3.checked = true;
    radio3.indeterminate = true;
    radio4.indeterminate = true;

    check1.checked = true;
    check1.indeterminate = true;

    check2.checked = false;
    check2.indeterminate = true;

    radio3.addEventListener('click', defaultPreventingHandler, false);
    radio4.addEventListener('click', defaultPreventingHandler, false);
    check1.addEventListener('click', defaultPreventingHandler, false);
    check2.addEventListener('click', defaultPreventingHandler, false);

    // Clicking selected radio should not unselect them both
    dispatchEvent(radio1, "click", 2, 2);

    // Default-prevented click should not change checked or intermediate state
    dispatchEvent(radio3, "click", 2, 2);
    dispatchEvent(radio4, "click", 2, 2);

    // Default-prevented click should not change checked or intermediate state
    dispatchEvent(check1, "click", 2, 2);
    dispatchEvent(check2, "click", 2, 2);

    debug('unselect all radio buttons');
    shouldBeTrue(radio1.checked);

    debug('Checking whether default-prevented click clobbered indeterminate state:');
    debug('On checked radio button');
    shouldBeTrue(radio3.indeterminate);
    debug('On unchecked radio button');
    shouldBeTrue(radio4.indeterminate);
    debug('On checked checkbox');
    shouldBeTrue(check1.indeterminate);
    debug('On unchecked checkbox');
    shouldBeTrue(check2.indeterminate);

    debug('Checking whether default-prevented click clobbered checked state:');
    debug('On checked radio button');
    shouldBeTrue(radio3.checked);
    debug('On unchecked radio button');
    shouldBeFalse(radio4.checked);
    debug('On checked checkbox');
    shouldBeTrue(check1.checked);
    debug('On unchecked checkbox');
    shouldBeFalse(check2.checked);
  }

  runTests();
}
