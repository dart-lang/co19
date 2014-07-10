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
      <div id=t></div>
      <div id=console></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var t = document.getElementById('t');

  t.style.backgroundPositionX = '5%';
  shouldBe(t.style.backgroundPosition, "5%");
  shouldBe(t.style.backgroundPositionX, "5%");
  shouldBe(t.style.backgroundPositionY, "");
  shouldBe(t.style.cssText, "background-position-x: 5%;");
  shouldBe(t.getAttribute('style'), "background-position-x: 5%;");

  t.style.backgroundPositionY = '5%';
  shouldBe(t.style.backgroundPosition, "5% 5%");
  shouldBe(t.style.backgroundPositionX, "5%");
  shouldBe(t.style.backgroundPositionY, "5%");
  shouldBe(t.style.cssText, "background-position: 5% 5%;");
  shouldBe(t.getAttribute('style'), "background-position: 5% 5%;");

  t.style.backgroundPosition = '10% 10%';
  shouldBe(t.style.backgroundPosition, "10% 10%");
  shouldBe(t.style.backgroundPositionX, "10%");
  shouldBe(t.style.backgroundPositionY, "10%");
  shouldBe(t.style.cssText, "background-position: 10% 10%;");
  shouldBe(t.getAttribute('style'), "background-position: 10% 10%;");

  t.style.backgroundPositionX = '20%';
  shouldBe(t.style.backgroundPosition, "20% 10%");
  shouldBe(t.style.backgroundPositionX, "20%");
  shouldBe(t.style.backgroundPositionY, "10%");
  shouldBe(t.style.cssText, "background-position: 20% 10%;");
  shouldBe(t.getAttribute('style'), "background-position: 20% 10%;");

  t.style.backgroundPositionY = '20%';
  shouldBe(t.style.backgroundPosition, "20% 20%");
  shouldBe(t.style.backgroundPositionX, "20%");
  shouldBe(t.style.backgroundPositionY, "20%");
  shouldBe(t.style.cssText, "background-position: 20% 20%;");
  shouldBe(t.getAttribute('style'), "background-position: 20% 20%;");

  t.setAttribute('style', 'background-position: 30% 30%');
  shouldBe(t.style.backgroundPosition, "30% 30%");
  shouldBe(t.style.backgroundPositionX, "30%");
  shouldBe(t.style.backgroundPositionY, "30%");
  shouldBe(t.style.cssText, "background-position: 30% 30%;");
  shouldBe(t.getAttribute('style'), "background-position: 30% 30%");

  t.style.backgroundPositionX = '20%';
  shouldBe(t.style.backgroundPosition, "20% 30%");
  shouldBe(t.style.backgroundPositionX, "20%");
  shouldBe(t.style.backgroundPositionY, "30%");
  shouldBe(t.style.cssText, "background-position: 20% 30%;");
  shouldBe(t.getAttribute('style'), "background-position: 20% 30%;");

  t.style.backgroundPositionY = '20%';
  shouldBe(t.style.backgroundPosition, "20% 20%");
  shouldBe(t.style.backgroundPositionX, "20%");
  shouldBe(t.style.backgroundPositionY, "20%");
  shouldBe(t.style.cssText, "background-position: 20% 20%;");
  shouldBe(t.getAttribute('style'), "background-position: 20% 20%;");

  t.setAttribute('style', 'background-position: 60% 60% !important;');
  shouldBe(t.style.backgroundPosition, "60% 60%");
  shouldBe(t.style.backgroundPositionX, "60%");
  shouldBe(t.style.backgroundPositionY, "60%");
  shouldBe(t.style.cssText, "background-position: 60% 60% !important;");

  t.setAttribute('style', 'background-position: 10px 15px, 20px 25px, 30px 35px');
  shouldBe(t.style.backgroundPosition, "10px 15px, 20px 25px, 30px 35px");
  shouldBe(t.style.backgroundPositionX, "10px, 20px, 30px");
  shouldBe(t.style.backgroundPositionY, "15px, 25px, 35px");
  shouldBe(t.style.cssText, "background-position: 10px 15px, 20px 25px, 30px 35px;");

  t.setAttribute('style', 'background: url(about:blank) 80% 80%;');
  t.style.backgroundPositionY = '50px';
  shouldBe(t.style.cssText, 'background: url(about:blank) 80% 50px;');
}
