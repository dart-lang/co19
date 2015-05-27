/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that <style scoped> is correctly applied as child of a
 * ShadowRoot, and that it doesn't leak out.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <div id="A">
          AAA
      </div>
      <div id="B">
          BBB
      </div>
      <div id="D">
          DDD
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  //var shouldBeDefined = shouldBeNonNull;

  var a = document.getElementById("A");
  var b = document.getElementById("B");
  var shadow = b.createShadowRoot();
  shouldBeDefined(shadow.innerHtml);
  shouldBeDefined(shadow.getElementById);
  shadow.innerHtml = "<style scoped>div { color: red; }</style><content></content><div id='C'>CCC</div>";
  var c = shadow.getElementById("C");
  var d = document.getElementById("D");

  debug("A:");
  shouldBe(getComputedStyle(a, null).getPropertyValue('color'), 'rgb(0, 0, 0)');
  debug("B:");
  shouldBe(getComputedStyle(b, null).getPropertyValue('color'), 'rgb(0, 0, 0)');
  debug("C:");
  shouldBe(getComputedStyle(c, null).getPropertyValue('color'), 'rgb(255, 0, 0)');
  debug("D:");
  shouldBe(getComputedStyle(d, null).getPropertyValue('color'), 'rgb(0, 0, 0)');
}
