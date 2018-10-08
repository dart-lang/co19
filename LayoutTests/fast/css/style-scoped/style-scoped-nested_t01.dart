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
      #target, #targetInShadow {
          color: red;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="grandparent">
        <div id="parent">
          <span class="target" id="target"></span>
        </div>
      </div>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  debug("Test whether scoped styles are applied in the cascade order or not.");
  debug("If this test passes, rules which are declared in descendant scoping element are applied to a target element.");
  debug("c.f. https://bugs.webkit.org/show_bug.cgi?id=103239");

  var target = document.getElementById("target");
  debug("Only document.style is applied to the target.");
  shouldBe(getComputedStyle(target).color, "rgb(255, 0, 0)");

  dynamic styleForGrandparent = document.createElement("style");
  styleForGrandparent.scoped = true;
  styleForGrandparent.append(new Text(".target { color: yellow; }"));
  document.getElementById("grandparent").append(styleForGrandparent);
  debug("A new scoped style is inserted into the grandparent node of the target. A class rule in the inserted scoped style wins an id rule in document.style.");
  shouldBe(getComputedStyle(target).color, "rgb(255, 255, 0)");

  dynamic styleForParent = document.createElement("style");
  styleForParent.scoped = true;
  styleForParent.append(new Text("span { color: blue; }"));
  document.getElementById("parent").append(styleForParent);
  debug("A new scoped style is inserted into the parent node of the target. A tag rule in the inserted scoped style wins an id rule and a class rule in existing styles.");
  shouldBe(getComputedStyle(target).color, "rgb(0, 0, 255)");
}
