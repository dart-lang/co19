/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description
 * Tests for https://bugs.webkit.org/show_bug.cgi?id=14439i bug 14439.
 * Button type should be set using el.type.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <form id="f" action="#submitted">
      <input id="t" type="text" />
      <button id="b"></button>
    </form>
    ''', treeSanitizer: new NullTreeSanitizer());

  var didSubmit = false;
  ButtonElement btn;
  var txt;

  var form = document.getElementById("f");
  form.onSubmit.listen((_) {
    didSubmit = true;
  });

  testTypeValue()
  {
    btn = document.getElementById("b");

    btn.type = 'submit';
    shouldBe(btn.type, 'submit');
    shouldBe(btn.getAttribute('type'), 'submit');

    btn.type = 'reset';
    shouldBe(btn.type, 'reset');
    shouldBe(btn.getAttribute('type'), 'reset');

    btn.type = 'button';
    shouldBe(btn.type, 'button');
    shouldBe(btn.getAttribute('type'), 'button');

    btn.type = 'reset';
    shouldBe(btn.type, 'reset');
    shouldBe(btn.getAttribute('type'), 'reset');

    btn.type = 'suBmiT';
    shouldBe(btn.type, 'submit');
    shouldBe(btn.getAttribute('type'), 'suBmiT');

    btn.type = '';
    shouldBe(btn.type, 'submit');
    shouldBe(btn.getAttribute('type'), '');

    btn.type = 'b';
    shouldBe(btn.type, 'submit');
    shouldBe(btn.getAttribute('type'), 'b');

    btn.type = 'RESET';
    shouldBe(btn.type, 'reset');
    shouldBe(btn.getAttribute('type'), 'RESET');

    btn.type = '';
    shouldBe(btn.type, 'submit');
    shouldBe(btn.getAttribute('type'), '');

    btn.type = '/';
    shouldBe(btn.type, 'submit');
    shouldBe(btn.getAttribute('type'), '/');

    btn.type = ' ';
    shouldBe(btn.type, 'submit');
    shouldBe(btn.getAttribute('type'), ' ');

    btn.type = 'button ';
    shouldBe(btn.type, 'submit');
    shouldBe(btn.getAttribute('type'), 'button ');

    btn.type = ' b u t t o n ';
    shouldBe(btn.type, 'submit');
    shouldBe(btn.getAttribute('type'), ' b u t t o n ');

    //btn.type = null;
    //shouldBe(btn.type, 'submit');
    //shouldBe(btn.getAttribute('type'), 'null');
  }

  testTypeBehavior()
  {
    btn = document.getElementById("b");
    txt = document.getElementById("t");

    btn.type = "submit";
    txt.value = "hello";
    btn.type = 'reset';
    txt.value = 'hello';
    btn.click(); 
    shouldBe(txt.value, '');
    shouldBe(didSubmit, false);

    btn.type = 'button';
    txt.value = 'hello';
    btn.click(); 
    shouldBe(txt.value, 'hello');
  }

  testSubmitBehavior()
  {
    btn.type = 'submit';
    btn.click(); 
    shouldBe(didSubmit, true);
    didSubmit = false;
    txt.value = "";
  }

  testTypeValue();
  testTypeBehavior();
  testSubmitBehavior();
}
