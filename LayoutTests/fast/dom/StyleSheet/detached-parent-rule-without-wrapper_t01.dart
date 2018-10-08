/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that CSS stylesheets lacking wrappers are pruned from 
 * detached CSSOM subtrees. This is surprising behavior, but it's a very rare
 * situation, and the behavior actually matches what both WebKit and Gecko do
 * for DOM nodes in detached subtrees.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
    <style>
    @media all { #test { color: green; } }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <div id="test"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(window.getMatchedCssRules(document.getElementById("test"), '').length, 1);
  var rule = window.getMatchedCssRules(document.getElementById("test"), '')[0];
  debug("Removing &lt;style>...");
  style.remove();
  shouldBe(rule.parentRule, null);
  shouldBe(window.getMatchedCssRules(document.getElementById("test"), ''), null);
}

