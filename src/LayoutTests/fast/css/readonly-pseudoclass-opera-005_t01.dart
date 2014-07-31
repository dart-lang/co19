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
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
       input { background: red; }
       #i1:read-write { background: lime; }
       #i2 { background: lime; }
       #i2:read-only { background: red; }
       #i3:read-write { background: lime; }
       #i4:read-only { background: lime; }
       #i5:read-only { background: lime; }
       #i6:read-write { background: lime; }

      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>This test checks for :read-only and :read-write right behavior along with readonly attribute. Fails if some FAILURE is shown below.</p>

      <input id="i1"/>
      <input type="radio" readonly="readonly" id="i2"/>
      <input readonly="readonly" id="i3"/>
      <input id="i4"/>
      <input id="i5"/>
      <input readonly="readonly" id="i6"/>
      <hr>
      <ol id="console"></ol>
      ''', treeSanitizer: new NullTreeSanitizer());

  elem(id) => document.getElementById(id) as InputElement;

  elem('i3').attributes.remove('readonly');
  elem('i4').readOnly = true;
  elem('i5').setAttribute('readonly','readonly');
  elem('i6').readOnly = false;

  var i = document.getElementsByTagName("input");
  for (var c = 0; c < i.length; c++) {
    shouldBe(getComputedStyle(i[c], null).getPropertyValue('background-color'), "rgb(0, 255, 0)");
  }
}
