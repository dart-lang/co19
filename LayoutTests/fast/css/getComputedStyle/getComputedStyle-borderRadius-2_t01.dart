/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test calling getPropertyValue on computed styles for border
 * radius shorthand properties.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
          .test { float: left; width: 50px; height: 50px; border: 1px solid black; }
          #borderRadius1 { border-radius: 0 0 10px 10px; }
          #borderRadius2 { border-radius: 0 0 0 10px; }
          #borderRadius3 { border-radius: 0 0 10px; }
          #borderRadius4 { border-radius: 0 10px; }
          #borderRadius5 { border-radius: 10px; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <pre id="console"></pre>
      <div class="test" id="borderRadius1"></div>
      <div class="test" id="borderRadius2"></div>
      <div class="test" id="borderRadius3"></div>
      <div class="test" id="borderRadius4"></div>
      <div class="test" id="borderRadius5"></div>
      <div class="test" id="NoBorderRadius"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(getComputedStyle(document.getElementById('borderRadius1')).getPropertyValue('border-radius'), '0px 0px 10px 10px');
  shouldBe(getComputedStyle(document.getElementById('borderRadius2')).getPropertyValue('border-radius'), '0px 0px 0px 10px');
  shouldBe(getComputedStyle(document.getElementById('borderRadius3')).getPropertyValue('border-radius'), '0px 0px 10px');
  shouldBe(getComputedStyle(document.getElementById('borderRadius4')).getPropertyValue('border-radius'), '0px 10px');
  shouldBe(getComputedStyle(document.getElementById('borderRadius5')).getPropertyValue('border-radius'), '10px');
  shouldBe(getComputedStyle(document.getElementById('NoBorderRadius')).getPropertyValue('border-radius'), '0px');
}
