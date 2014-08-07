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
      <p>Test for Blink bug <a href="https://code.google.com/p/chromium/issues/detail?id=228870">228870</a>: CSS parser incorrectly handles invalid @-webkit-keyframes key values</p>
      <style>
          @-webkit-keyframes foo {
              0 {foo: bar;}
          }

          #test1 {
              display: none;
          }
      </style>

      <style>
          @-webkit-keyframes foo {
              0, 100% {foo: bar;}
          }

          #test2 {
              display: none;
          }
      </style>

      <style>
          @-webkit-keyframes foo {
              10%, none {foo: bar;}
          }

          #test3 {
              display: none;
          }
      </style>

      <style>
          @-webkit-keyframes foo {
              -10%, from {foo: bar;}
          }

          #test4 {
              display: none;
          }
      </style>

      <style>
          @-webkit-keyframes foo {
              0 {foo: bar;} from
          }

          #test5 {
              display: none;
          }
      </style>

      <style>
          @-webkit-keyframes foo {
              {foo: bar;}
          }

          #test6 {
              display: none;
          }
      </style>

      <style>
          @-webkit-keyframes foo {
              10%
          }

          #test7 {
              display: none;
          }
      </style>

      <style>
          @-webkit-keyframes foo {
              from (}) {}
              #(}) {}
          }

          #test8 {
              display: none;
          }
      </style>

      <div id="test1">FAIL</div><div> (INTEGER single key)</div>
      <div id="test2">FAIL</div><div> (INTEGER in a key list)</div>
      <div id="test3">FAIL</div><div> (unknown IDENT in a key list)</div>
      <div id="test4">FAIL</div><div> (out-of-range percentage key value in a key list)</div>
      <div id="test5">FAIL</div><div> (key list with no block)</div>
      <div id="test6">FAIL</div><div> (no key list)</div>
      <div id="test7">FAIL</div><div> (no declaration block)</div>
      <div id="test8">FAIL</div><div> (handling invalid perentheses block)</div>
      ''', treeSanitizer: new NullTreeSanitizer());
}
