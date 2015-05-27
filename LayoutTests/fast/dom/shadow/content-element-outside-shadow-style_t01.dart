/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html(''' 
    <style>
    content {
        color: blue;
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <div>
      <content>Should be colored blue.</content>
    </div>
    <div>
      <div id="hostWithChild">Should have no cool color.</div>
      <content id="toBeMoved">Should have no cool color either.</content>
      <div id="hostEmpty"></div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  // Ensures that distributed shadow child isn't effected by the style.
  var hostWithChild = document.getElementById("hostWithChild");
  var shadowForHostWithChild = hostWithChild.createShadowRoot();
  shadowForHostWithChild.append(document.createElement("content"));

  // Also ensures that dynamically moved <content> elements do work.
  var hostEmpty = document.getElementById("hostEmpty");
  var shadowForHostEmpty = hostEmpty.createShadowRoot();
  shadowForHostEmpty.append(document.getElementById("toBeMoved"));

  color(e) => e.getComputedStyle().color;

  shouldBe(color(document.getElementById("hostWithChild")), 'rgb(0, 0, 0)');
  shouldBe(color(document.getElementById("hostEmpty")), 'rgb(0, 0, 0)');
}
