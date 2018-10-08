/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test passes if it does not find the element whose id is
 * "first", because even though it has a sibling whose id matches the fragment
 * of the url of this test, that sibling comes after, not before the "first"
 * element.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      div.class { background-color: red; }
      :hover {background-color:blue; }
      :target~#first { background-color: green; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p id="description"></p>
      <div tabindex=1" id="first" class="class"></div>
      <div tabindex=2" id="second" class="class"></div>
      <div tabindex=3" id="third" class="class"></div>
      <div tabindex=4" id="fourth" class="class"></div>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  hashchange(_) {
    var el = document.getElementById("first");
    shouldBe(getComputedStyle(el, null).getPropertyValue('background-color'), 'rgb(255, 0, 0)');

    el = document.getElementById("second");
    shouldBe(getComputedStyle(el, null).getPropertyValue('background-color'), 'rgb(255, 0, 0)');

    el = document.getElementById("third");
    shouldBe(getComputedStyle(el, null).getPropertyValue('background-color'), 'rgb(255, 0, 0)');

    el = document.getElementById("fourth");
    shouldBe(getComputedStyle(el, null).getPropertyValue('background-color'), 'rgb(255, 0, 0)');
    asyncEnd();
  }

  document.body.onHashChange.listen(hashchange);

  asyncStart();

  //if (window.location.hash.indexOf("second") == -1) {
    window.location.hash = "#second";
  //}
}
