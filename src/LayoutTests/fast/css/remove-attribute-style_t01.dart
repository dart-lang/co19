/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description [bug 99295] attributes.remove('style') not working in certain
 * circumstances. If this test passes, all backgroundColors are rgba(0, 0, 0,
 * 0), i.e. all styles are removed.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style type="text/css">
      td {
          display: table-cell;
          width: 200px;
          height: 80px;
          border: 1px solid #ccc;
          text-align: center;
          vertical-align: middle;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <table id="table">
        <tr>
          <td id="elementWithoutStyleAttribute">no HTML style attribute, no get/setAttribute</td>
          <td id="elementWithEmptyStyleAttribute" style="">empty HTML style attribute, no get/setAttribute</td>
          <td id="elementWithStyleAttribute" style="opacity: 1;">non-empty HTML style attribute, no get/setAttribute</td>
        </tr>
        <tr>
          <td id="elementWithoutStyleAttribute2">no HTML style attribute, getAttribute before modifying IDL attribute</td>
          <td id="elementWithoutStyleAttribute3">no HTML style attribute, getAttribute after modifying IDL attribute</td>
          <td id="elementWithoutStyleAttribute4">no HTML style attribute, setAttribute before attributes.remove</td>
        </tr>
      </table>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  $(id) {
    return document.getElementById(id);
  }

  var elementWithoutStyleAttribute = $('elementWithoutStyleAttribute'),
      elementWithEmptyStyleAttribute = $('elementWithEmptyStyleAttribute'),
      elementWithStyleAttribute = $('elementWithStyleAttribute'),
      elementWithoutStyleAttribute2 = $('elementWithoutStyleAttribute2'),
      elementWithoutStyleAttribute3 = $('elementWithoutStyleAttribute3'),
      elementWithoutStyleAttribute4 = $('elementWithoutStyleAttribute4');

  elementWithoutStyleAttribute.style.backgroundColor = 'red'; 
  elementWithoutStyleAttribute.attributes.remove('style');
  shouldBe(getComputedStyle(elementWithoutStyleAttribute).backgroundColor, 'rgba(0, 0, 0, 0)');

  elementWithEmptyStyleAttribute.style.backgroundColor = 'red';
  elementWithEmptyStyleAttribute.attributes.remove('style');
  shouldBe(getComputedStyle(elementWithEmptyStyleAttribute).backgroundColor, 'rgba(0, 0, 0, 0)');

  elementWithStyleAttribute.style.backgroundColor = 'red';
  elementWithStyleAttribute.attributes.remove('style');
  shouldBe(getComputedStyle(elementWithStyleAttribute).backgroundColor, 'rgba(0, 0, 0, 0)');

  shouldBeNull(elementWithoutStyleAttribute2.getAttribute('style'));
  elementWithoutStyleAttribute2.style.backgroundColor = 'red';
  elementWithoutStyleAttribute2.attributes.remove('style');
  shouldBe(getComputedStyle(elementWithoutStyleAttribute2).backgroundColor, 'rgba(0, 0, 0, 0)');

  elementWithoutStyleAttribute3.style.backgroundColor = 'red';
  shouldBe(elementWithoutStyleAttribute3.getAttribute('style'), 'background-color: red;');
  elementWithoutStyleAttribute3.attributes.remove('style');
  shouldBe(getComputedStyle(elementWithoutStyleAttribute3).backgroundColor, 'rgba(0, 0, 0, 0)');

  elementWithoutStyleAttribute4.style.backgroundColor = 'red'; 
  elementWithoutStyleAttribute4.setAttribute('style', '');
  elementWithoutStyleAttribute4.attributes.remove('style'); 
  shouldBe(getComputedStyle(elementWithoutStyleAttribute4).backgroundColor, 'rgba(0, 0, 0, 0)');

  document.getElementById('table').innerHtml = '';
}
