/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description required/optional CSS pseudoclasses part 5
 * This test checks the CSS pseudoclasses for input types.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
       input:optional { background: lime; }
       input { background: red; }
       input:required { background: red; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <input id="range" type="range" required/>
      <input id="submit" type="submit" required/>
      <input id="image" type="image" required/>
      <input id="reset" type="reset" required/>
      <input id="button" type="button" required/>
      ''', treeSanitizer: new NullTreeSanitizer());

  isOptional(id) {
    return getComputedStyle(document.getElementById(id), null).getPropertyValue('background-color') == "rgb(0, 255, 0)";
  }

  shouldBeTrue(isOptional("range"));
  shouldBeTrue(isOptional("submit"));
  shouldBeTrue(isOptional("image"));
  shouldBeTrue(isOptional("reset"));
  shouldBeTrue(isOptional("button"));
}
