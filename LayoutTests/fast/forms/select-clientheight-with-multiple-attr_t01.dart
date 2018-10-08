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
      <p>HTMLSelectElement multiple attribute test when no size is specified</p>
      <div id="console"></div>

      <select multiple id="sel1" >
          <option value="1">One</option>
      </select>

      <select multiple id="sel2" >
          <option value="1">One</option>
          <option value="2">Two</option>
          <option value="3">Three</option>
          <option value="4">Four</option>
          <option value="5">Five</option>
          <option value="6">Six</option>
          <option value="7">Seven</option>
          <option value="8">Eight</option>
          <option value="9">Nine</option>
          <option value="10">Ten</option>
          <option value="11">Eleven</option>
          <option value="12">Twelve</option>
          <option value="13">Thirteen</option>
          <option value="14">Fourteen</option>
      </select>

      <select multiple id="sel3" >
          <option value="1">One</option>
          <option value="2">Two</option>
          <option value="3">Three</option>
      </select>
      ''', treeSanitizer: new NullTreeSanitizer());

  getElemById(elemId) {
    return document.getElementById(elemId);
  }

  clientHeight(elemId) {
    var element = getElemById(elemId);
    return element.clientHeight;
  }

  debug('test 1');
  shouldBe(clientHeight('sel2'), clientHeight('sel1'));
  debug('test 2');
  getElemById('sel2').setAttribute('size', '5'); shouldBeTrue(clientHeight('sel2') > clientHeight('sel1'));
  debug('test 3');
  shouldBe(clientHeight('sel3'), clientHeight('sel1'));
  debug('test 4');
  getElemById('sel3').setAttribute('size', '2'); shouldBe(clientHeight('sel3'), clientHeight('sel1'));
  debug('test 5');
  getElemById('sel3').setAttribute('size', '0'); shouldBe(clientHeight('sel3'), clientHeight('sel1'));
  debug('test 6');
  getElemById('sel3').setAttribute('size', ''); shouldBe(clientHeight('sel3'), clientHeight('sel1'));
  debug('test 7');
  getElemById('sel3').setAttribute('size', '1+ef'); shouldBe(clientHeight('sel3'), clientHeight('sel1'));
}
