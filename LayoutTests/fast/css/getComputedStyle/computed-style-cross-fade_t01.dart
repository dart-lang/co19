/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  testCrossfade(css, queryProp)
  {
    var div = document.createElement('div');
    div.setAttribute('style', css);
    document.body.append(div);

    var result = getComputedStyle(div).getPropertyValue(queryProp);
    div.remove();
    return result;
  }

  debug('<p>-webkit-cross-fade</p>');

  // Valid

  shouldBe(testCrossfade("opacity: 500%", "opacity"), "1");
  shouldBe(testCrossfade("background-image: -webkit-cross-fade(url(\"\"dummy://example.png\"\"), url(\"\"dummy://example.png\"\"), 50%)", "background-image"), "-webkit-cross-fade(url(\"\"dummy://example.png\"\"), url(\"\"dummy://example.png\"\"), 0.5)");
  shouldBe(testCrossfade("background-image: -webkit-cross-fade(-webkit-cross-fade(url(dummy://a.png), url(dummy://b.png), 25%), url(\"dummy://example.png\"), 50%)", "background-image"), "-webkit-cross-fade(-webkit-cross-fade(url(dummy://a.png), url(dummy://b.png), 0.25), url(\"dummy://example.png\"), 0.5)");
  shouldBe(testCrossfade("background-image: -webkit-cross-fade(url(dummy://c.png), -webkit-cross-fade(url(dummy://a.png), url(dummy://b.png), 25%), 50%)", "background-image"), "-webkit-cross-fade(url(dummy://c.png), -webkit-cross-fade(url(dummy://a.png), url(dummy://b.png), 0.25), 0.5)");
  shouldBe(testCrossfade("background-image: -webkit-cross-fade(-webkit-linear-gradient(black, white), url(\"dummy://example.png\"), 10%)", "background-image"), "-webkit-cross-fade(-webkit-linear-gradient(top, black, white), url(\"dummy://example.png\"), 0.1)");
  shouldBe(testCrossfade("background-image: -webkit-cross-fade(url(\"dummy://example.png\"), url(\"dummy://example.png\"), 1.0)", "background-image"), "-webkit-cross-fade(url(\"dummy://example.png\"), url(\"dummy://example.png\"), 1)");
  shouldBe(testCrossfade("background-image: -webkit-cross-fade(url(\"dummy://example.png\"), url(\"dummy://example.png\"), 0.5)", "background-image"), "-webkit-cross-fade(url(\"dummy://example.png\"), url(\"dummy://example.png\"), 0.5)");

  shouldBe(testCrossfade("background-image: -webkit-cross-fade(url(\"dummy://example.png\"), url(\"dummy://example.png\"), 5.0)", "background-image"), "-webkit-cross-fade(url(\"dummy://example.png\"), url(\"dummy://example.png\"), 1)");
  shouldBe(testCrossfade("background-image: -webkit-cross-fade(url(\"dummy://example.png\"), url(\"dummy://example.png\"), 700%)", "background-image"), "-webkit-cross-fade(url(\"dummy://example.png\"), url(\"dummy://example.png\"), 1)");

  shouldBe(testCrossfade("background-image: -webkit-cross-fade(url(\"dummy://example.png\"), url(\"dummy://example.png\"), -20)", "background-image"), "-webkit-cross-fade(url(\"dummy://example.png\"), url(\"dummy://example.png\"), 0)");

  // Invalid

  shouldBe(testCrossfade("background-image: -webkit-cross-fade(url(\"dummy://example.png\"), url(\"dummy://example.png\"))", "background-image"), "none");
  shouldBe(testCrossfade("background-image: -webkit-cross-fade(url(\"dummy://example.png\"), url(\"dummy://example.png\"),)", "background-image"), "none");
  shouldBe(testCrossfade("background-image: -webkit-cross-fade(url(\"dummy://example.png\"))", "background-image"), "none");
  shouldBe(testCrossfade("background-image: -webkit-cross-fade(), url(\"dummy://example.png\"))", "background-image"), "none");
  shouldBe(testCrossfade("background-image: -webkit-cross-fade(url(", "background-image"), "none");
  shouldBe(testCrossfade("background-image: -webkit-cross-fade(10px 20% 5px #bbb)", "background-image"), "none");
  shouldBe(testCrossfade("background-image: -webkit-cross-fade(-webkit-cross-fade(-webkit-cross-fade()))", "background-image"), "none");
  shouldBe(testCrossfade("background-image: -webkit-cross-fade(20%, url(dummy://a.png), url(dummy://b.png))", "background-image"), "none");
  shouldBe(testCrossfade("background-image: -webkit-cross-fade(url(dummy://a.png),)", "background-image"), "none");
  shouldBe(testCrossfade("background-image: -webkit-cross-fade(,)", "background-image"), "none");
  shouldBe(testCrossfade("background-image: -webkit-cross-fade(,url(dummy://a.png))", "background-image"), "none");
  shouldBe(testCrossfade("background-image: -webkit-cross-fade(,,,,,)", "background-image"), "none");
}
