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
      <input type="text" size="5" value="12345" maxlength="4" id="input1">
      <input type="text" size="5" maxlength="4" value="12345" id="input2">
      <input type="text" id="f" size="5" maxlength="4" value="123">
      <input type="text" id="e" size="5" maxlength="4" value="123">
      <input type="text" id="d" size="5" value="12345">
      <input type="text" id="c" size="5" value="12345">
      <input type="text" size="5" value="12x&#x305;&#x332;45" maxlength="4" id="input7">
      <input type="text" size="5" maxlength="4" value="12x&#x305;&#x332;45" id="input8">
      <input type="text" id="j" size="5" maxlength="4" value="123">
      <input type="text" id="i" size="5" maxlength="4" value="123">
      <input type="text" id="h" size="5" value="12x&#x305;&#x332;45">
      <input type="text" id="g" size="5" value="12x&#x305;&#x332;45">
      ''', treeSanitizer: new NullTreeSanitizer());

  String domValueOf(String id) {
    return (document.getElementById(id) as InputElement).value;
  }

//  visibleValueOf(id) {
//    var el = document.getElementById(id);
//    el.focus();
//    document.execCommand('SelectAll', false, '');
//    return window.getSelection().toString(); //FIXME
//  }

  String fancyX = "x" + new String.fromCharCode(0x305) + new String.fromCharCode(0x332);

  debug('maxlength and value that violates it, maxlength first');
  shouldBe(domValueOf("input1"), "12345");
  //shouldBe(visibleValueOf("input1"), "12345");

  debug('maxlength and value that violates it, maxlength first');
  shouldBe(domValueOf("input2"), "12345");
  //shouldBe(visibleValueOf("input2"), "12345");

  debug('set value attribute that violates maxlength');
  document.getElementById("f").setAttribute('value', '12345');
  shouldBe(domValueOf("f"), "12345");
  //shouldBe(visibleValueOf("input2"), "12345");

  debug('set value property that violates maxlength');
  (document.getElementById("e") as InputElement).value = '12345';
  shouldBe(domValueOf("e"), "12345");
  //shouldBe(visibleValueOf("e"), "12345");

  debug('set maxlength attribute that is smaller than initial value');
  document.getElementById("d").setAttribute('maxlength', '4');
  shouldBe(domValueOf("d"), "12345");
  //shouldBe(visibleValueOf("d"), "12345");

  debug('set maxLength property that is smaller than initial value');
  (document.getElementById("c") as InputElement).maxLength = 4;
  shouldBe(domValueOf("c"), "12345");
  //shouldBe(visibleValueOf("c"), "12345");

  debug('maxlength and value that violates it, maxlength first');
  shouldBe(domValueOf("input7"), "12" + fancyX + "45");
  //shouldBe(visibleValueOf("input7"), "12" + fancyX + "45");

  debug('maxlength and value that violates it, value first');
  shouldBe(domValueOf("input8"), "12" + fancyX + "45");
  //shouldBe(visibleValueOf("input8"), "12" + fancyX + "45");

  debug('set value attribute that violates maxlength');
  document.getElementById("j").setAttribute('value', '12' + fancyX + '45');
  shouldBe(domValueOf("j"), "12" + fancyX + "45");
  //shouldBe(visibleValueOf("j"), "12" + fancyX + "45");

  debug('set value property that violates maxlength');
  (document.getElementById("i") as InputElement).value = '12' + fancyX + '45';
  shouldBe(domValueOf("i"), "12" + fancyX + "45");
  //shouldBe(visibleValueOf("i"), "12" + fancyX + "45");

  debug('set maxlength attribute that is smaller than initial value');
  document.getElementById("h").setAttribute('maxlength', '4');
  shouldBe(domValueOf("h"), "12" + fancyX + "45");
  //shouldBe(visibleValueOf("h"), "12" + fancyX + "45");

  debug('set maxLength property that is smaller than initial value');
  (document.getElementById("g") as InputElement).maxLength = 4;
  shouldBe(domValueOf("g"), "12" + fancyX + "45");
  //shouldBe(visibleValueOf("g"), "12" + fancyX + "45");
}
