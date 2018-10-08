/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Pseudo classes with escaped start parenthesis
 */
import "dart:html";
import "../../testcommon.dart";
import "../../resources/testharness.dart";

main() {
  var index = document.getElementsByTagName("style").length; // skip test framework's ones

  dynamic styles = new DocumentFragment.html('''
      <style>:-webkit-any\( {}</style>
      <style>:nth-child\( {}</style>
      <style>:nth-of-type\( {}</style>
      <style>:nth-last-child\( {}</style>
      <style>:nth-last-of-type\( {}</style>
      <style>:lang\( {}</style>
      <style>:not\( {}</style>
      <style>:cue\( {}</style>
      <style>:part\( {}</style>
      <style>:host\( {}</style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(styles);

  document.body.setInnerHtml('''
      <p id="log"></p>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic sheets = document.styleSheets;

  test((){
    assert_equals(sheets.length, index+10, "StyleSheets.length");
  }, "All stylesheets present");

  for (var i = index; i < sheets.length; i++) {
    test((){
      assert_equals(sheets[i].cssRules.length, 0, "cssRules.length");
    }, "Drop \"" + sheets[i].ownerNode.firstChild.data + "\"");
  }
}
