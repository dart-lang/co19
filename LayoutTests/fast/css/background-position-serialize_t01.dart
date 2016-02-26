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
      <div id=t></div>
      <div id=console></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var t = document.getElementById('t');

  t.style.backgroundPosition = '10% 10%';
  shouldBeLikeString(t.style.backgroundPosition, "10% 10%");
  shouldBeLikeString(t.style.cssText, "background-position: 10% 10%;");
  shouldBeLikeString(t.getAttribute('style'), "background-position: 10% 10%;");

  t.setAttribute('style', 'background-position: 30% 30%');
  shouldBeLikeString(t.style.backgroundPosition, "30% 30%");
  shouldBeLikeString(t.style.cssText, "background-position: 30% 30%;");
  shouldBeLikeString(t.getAttribute('style'), "background-position: 30% 30%");

  t.setAttribute('style', 'background-position: 60% 60% !important;');
  shouldBeLikeString(t.style.backgroundPosition, "60% 60%");
  shouldBeLikeString(t.style.cssText, "background-position: 60% 60% !important;");

  t.setAttribute('style', 'background-position: 10px 15px, 20px 25px, 30px 35px');
  shouldBeLikeString(t.style.backgroundPosition, "10px 15px, 20px 25px, 30px 35px");
  shouldBeLikeString(t.style.cssText, "background-position: 10px 15px, 20px 25px, 30px 35px;");
}
