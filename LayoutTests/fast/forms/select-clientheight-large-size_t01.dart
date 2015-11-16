/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that select elements cap their size to the size attribute
 * and to 4 when no size is specified.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="output"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  getElemById(elemId) {
    return document.getElementById(elemId);
  }

  clientHeight(elemId) {
    return getElemById(elemId).clientHeight;
  }

  multipleOfElement(elemId, multiple) {
    return clientHeight(elemId) * multiple + (multiple - 1);
  }

  addSelect(id, numOptions) {
    var html = '<select multiple id="$id">';
    for (var i = 0; i <= numOptions; i++)
      html += '<option value="$i">$i</option>';
    getElemById('output').appendHtml(html + '</select>', treeSanitizer: new NullTreeSanitizer());
  }

  addSelect('select1', 10);
  addSelect('select2', 16);

  debug('test 1');
  shouldBe(clientHeight('select2'), clientHeight('select1'));
  debug('test 2');
  getElemById('select2').setAttribute('size', '4'); shouldBeTrue(clientHeight('select2') == clientHeight('select1'));
  debug('test 3');
  getElemById('select2').setAttribute('size', '5'); shouldBeTrue(clientHeight('select2') > clientHeight('select1'));
  debug('test 4');
  getElemById('select2').setAttribute('size', '8'); shouldBeTrue(clientHeight('select2') == multipleOfElement('select1', 2));
  debug('test 5');
  getElemById('select2').setAttribute('size', '12'); shouldBeTrue(clientHeight('select2') == multipleOfElement('select1', 3));
  debug('test 6');
  getElemById('select2').setAttribute('size', '16'); shouldBeTrue(clientHeight('select2') == multipleOfElement('select1', 4));
}
