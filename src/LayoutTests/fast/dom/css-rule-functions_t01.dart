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
  var style = new DocumentFragment.html('''
    <style id="style1">
        div.div1 { color:red }    
    </style>

    <style id="style2">
        div.div3 {color: yellow }
    </style>

    <style id="style3">
        div.div5 {color: purple }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    This tests that insertRule, deleteRule, and the IE extensions addRule and removeRule update the style when rules are added and removed. It also tests that disabling a stylesheet updates the style.
    <div class="div1">This is div1. This text should not be red because that rule has been removed.</div>
    <div class="div2">This is div2. This text should be blue because a matching rule with that property has been added.</div>
    <div class="div3">This is div3. This text should not be yellow because that rule has been removed.</div>
    <div class="div4">This is div4. This text should be green because a matching rule with that property has been added.</div>
    <div class="div5">This is div3. This text should not be purple because the stylesheet with that rule has been disabled.</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var s1 = document.getElementById('style1').sheet;

  // First append a style rule
  s1.insertRule('div.div2 {color: blue}', s1.cssRules.length);

  // Next, remove the first style rule
  s1.deleteRule(0);

  s1 = document.getElementById('style2').sheet;

  // Append a rule using the IE method
  s1.addRule('div.div4', 'color: green');

  // Remove a rule using the IE method;
  s1.removeRule(0);

  var s3 = document.getElementById('style3').sheet;
  s3.disabled = true;

  color (klass) => document.querySelector('.$klass').getComputedStyle().color;

  shouldBe(color('div1'), 'rgb(0, 0, 0)');
  shouldBe(color('div2'), 'rgb(0, 0, 255)');
  shouldBe(color('div3'), 'rgb(0, 0, 0)');
  shouldBe(color('div4'), 'rgb(0, 128, 0)');
  shouldBe(color('div5'), 'rgb(0, 0, 0)');
}
