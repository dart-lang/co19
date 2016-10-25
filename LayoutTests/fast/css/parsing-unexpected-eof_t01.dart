/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description CSS Parser - auto-close for unexpected EOF
 */
import "dart:html";
import "../../testcommon.dart";
import "../../resources/testharness.dart";

main() {
  dynamic style = new Element.html('''
      <style>
        div {}
        div {}
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="qs"><i class="x"></i><b></b></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var sheet = style.sheet;
  var rules = sheet.cssRules;

  test((){
    // internal_decls
    rules[0].style.cssText = "width: 200px; color: rgb(10, 20, 30";
    assert_equals(rules[0].style.width, "200px", "Width not set correctly.");
    assert_equals(rules[0].style.color, "rgb(10, 20, 30)", "Color not set correctly");
  }, "Unexpected EOF - CSSStyleDeclaration.cssText missing ')'");

  test((){
    // internal_value
    rules[0].style.color = "rgba(0, 0, 0, 0.2";
    assert_equals(rules[0].style.color, "rgba(0, 0, 0, 0.2)", "rgba value not set correctly");
  }, "Unexpected EOF - CSSStyleDeclaration.color missing ')'");

  test((){
    // internal_selector
    rules[0].selectorText = "#x, [name=\"x";
    assert_equals(rules[0].selectorText, "#x, [name=\"x\"]");
  }, "Unexpected EOF - CSSStyleRule.selectorText missing ']'");

  test((){
    // internal_rule
    sheet.insertRule("span { color: green", 2);
    assert_equals(rules[2].cssText, "span { color: green; }");
  }, "Unexpected EOF - CSSStyleSheet.insertRule missing '}'");

  test((){
    // internal_selector
    assert_equals(document.querySelector("#qs [class=x").tagName, "I");
  }, "Unexpected EOF - querySelector missing ']'");

  test((){
    // internal_selector
    assert_equals(document.querySelector("#qs :nth-child(2").tagName, "B");
  }, "Unexpected EOF - querySelector missing ')'");
}
