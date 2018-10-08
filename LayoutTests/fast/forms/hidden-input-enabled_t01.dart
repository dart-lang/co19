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

main() {
  var f = new DocumentFragment.html('''
      <style>
          #input {
              color:purple;
          }
          
          #input:enabled {
              color:red;
          }
          
          #input:disabled {
              color:green;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <input id="input" type="hidden"></input>
      ''', treeSanitizer: new NullTreeSanitizer());

  var input = document.getElementById("input");
  var color = getComputedStyle(input, null).color;

  shouldBeTrue(color == "rgb(255, 0, 0)" // :enabled
      || color == "rgb(0, 255, 0)");     // :disabled
}
