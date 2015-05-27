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
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <div>
      Tests error recovery in CSS selectors.
      </div>

      <style>.hidden-by-default div {display: none}</style>
      <div class="hidden-by-default">

      <style>[{}#test1{display: block}]{}</style>
      <div id="test1"></div>

      <style>[#{}#test2{display: block}]{}</style>
      <div id="test2"></div>
          
      <style>[x{}#test3{display: block}]{}</style>
      <div id="test3"></div>

      <style>:-webkit-any({}#test4{display: block}){}</style>
      <div id="test4"></div>

      <style>:func({}#test5{display: block}){}</style>
      <div id="test5"></div>

      <style>:cue({}#test6{display: block}){}</style>
      <div id="test6"></div>

      <style>::cue({}#test7{display: block}){}</style>
      <div id="test7"></div>

      <style>x,:cue({}#test8{display: block}){}</style>
      <div id="test8"></div>

      <style>x,cue({}#test9{display: block}){}</style>
      <div id="test9"></div>

      <style>x,:cue({}#test10{display: block}){}</style>
      <div id="test10"></div>

      <style>x,(url('example.org'){}#test11{display: block}){}</style>
      <div id="test11"></div>

      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var tests = document.querySelectorAll("[id^=test]");
  for (var i = 0; i < tests.length; i++)
    tests[i].text = "FAIL";
}
