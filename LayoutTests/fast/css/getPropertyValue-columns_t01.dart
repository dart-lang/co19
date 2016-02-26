/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description https://bugs.webkit.org/show_bug.cgi?id=111011
 * Bug 111011: getPropertyValue for -webkit-columns returns null, should
 * compute the shorthand value
 */
import "dart:html";
import "../../testcommon.dart";

main() {

  var style = new Element.html('''
      <style>
        .test {
          width: 100px;
          height: 100px;
        }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="columns1" class="test" style="-webkit-columns: 10px;"></div>
      <div id="columns2" class="test" style="-webkit-columns: 10;"></div>
      <div id="columns3" class="test" style="-webkit-columns: 10px auto;"></div>
      <div id="columns4" class="test" style="-webkit-columns: auto;"></div>
      <div id="columns5" class="test" style="-webkit-columns: auto 2;"></div>
      <div id="columns6" class="test" style="-webkit-column-width: 10px; -webkit-column-count: 2;"></div>
      <div id="columns7" class="test" style="-webkit-column-width: auto; -webkit-column-count: auto;"></div>
      <div id="columns8" class="test" style="-webkit-columns: foo;"></div>
      <div id="columns9" class="test" style="-webkit-column-width: 10px;"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  if (document.getElementById("columns1").style.supportsProperty("-webkit-columns")) {
    webkitColumnsValue(id) {
      var element = document.getElementById(id);
      return element.style.getPropertyValue("-webkit-columns");
    }

    shouldBeLikeString(webkitColumnsValue("columns1"), '10px auto');
    shouldBeLikeString(webkitColumnsValue("columns2"), 'auto 10');
    shouldBeLikeString(webkitColumnsValue("columns3"), '10px auto');
    shouldBeLikeString(webkitColumnsValue("columns4"), 'auto auto');
    shouldBeLikeString(webkitColumnsValue("columns5"), 'auto 2');
    shouldBeLikeString(webkitColumnsValue("columns6"), '10px 2');
    shouldBeLikeString(webkitColumnsValue("columns7"), 'auto auto');
    debug("NOTE: 'foo' is an illegal CSS value for '-webkit-columns'.");
    shouldBeLikeString(webkitColumnsValue("columns8"), "");
    debug(
        "NOTE: If only few longhand properties are specified, getPropertyValue for shorthand property returns null.");
    shouldBeLikeString(webkitColumnsValue("columns9"), "");
  }
}
