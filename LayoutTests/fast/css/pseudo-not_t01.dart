/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test if the :not selector gets the specificity of its
 * simple selector in various scenarios.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>

      #test1 :not(.evenclass1) { background-color: green; }
      #test1 :not(h1) { background-color: blue; }
      #test1 span { background-color: red; }

      #test2 .evenclass2 { background-color: green; }
      #test2 :not(h1) { background-color: blue; }

      #test3 .evenclass3 { background-color: green; }
      #test3 :not(.oddclass3) { background-color: red; }
      #test3 :not(.evenclass3) { background-color: gray; }
      #test3 .evenclass3 { background-color: blue; }

      #test4 span { background-color: blue; }
      #test4 :not(#span40) { background-color: green; }
      #test4 .evenclass4 { background-color: red; }
      #test4 #span42 { background-color: blue; }

      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p id="description"></p>

      debug("These spans should alternate red and green");
      <div id="test1"></div><br>
      debug("These spans should alternate green and blue");
      <div id="test2"></div><br>
      debug("These spans should alternate blue and gray");
      <div id="test3"></div><br>
      debug("These spans should be red, green, blue, green");
      <div id="test4"></div><br>


      <br>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  classForI(i) {
    if (i % 2 == 0)
      return "evenclass";
    return "oddclass";
  }

  var j = 1;
  var i = 0;
  for (; j < 5; j++) {
    var str = "";
    for (i = 0 ; i < 4; i++) {
      var theId = "span$j$i";
      var theClass = "${classForI(i)}$j";
      str += '<span class="' + theClass + '" id="' + theId + '" foo="' + theId +  '"> span  id= ' + theId + ' class = ' + theClass + '</span>';
    }
    document.getElementById("test$j").innerHtml = str;
  }

  debug("Test that :not selector with class name gets higher specificity than :not selector with tag name, or a selector with tag name");
  var el = document.getElementById("span10");
  shouldBe(getComputedStyle(el, null).getPropertyValue('background-color'), 'rgb(255, 0, 0)');

  el = document.getElementById("span11");
  shouldBe(getComputedStyle(el, null).getPropertyValue('background-color'), 'rgb(0, 128, 0)');

  debug("Test that :not selector with tag name does not get higher specificity than a selector with class name");
  el = document.getElementById("span20");
  shouldBe(getComputedStyle(el, null).getPropertyValue('background-color'), 'rgb(0, 128, 0)');

  el = document.getElementById("span21");
  shouldBe(getComputedStyle(el, null).getPropertyValue('background-color'), 'rgb(0, 0, 255)');

  debug("Test that :not selector with class name gets the same specificity as any selector with class name");
  el = document.getElementById("span30");
  shouldBe(getComputedStyle(el, null).getPropertyValue('background-color'), 'rgb(0, 0, 255)');

  el = document.getElementById("span31");
  shouldBe(getComputedStyle(el, null).getPropertyValue('background-color'), 'rgb(128, 128, 128)');

  debug("Test that :not selector with id gets higher specificity than a selector with class name, but the same specificity as any selector with id");
  el = document.getElementById("span40");
  shouldBe(getComputedStyle(el, null).getPropertyValue('background-color'), 'rgb(255, 0, 0)');

  el = document.getElementById("span41");
  shouldBe(getComputedStyle(el, null).getPropertyValue('background-color'), 'rgb(0, 128, 0)');

  el = document.getElementById("span42");
  shouldBe(getComputedStyle(el, null).getPropertyValue('background-color'), 'rgb(0, 0, 255)');

  el = document.getElementById("span43");
  shouldBe(getComputedStyle(el, null).getPropertyValue('background-color'), 'rgb(0, 128, 0)');
}
