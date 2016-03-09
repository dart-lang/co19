/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This tests checks that all of the input values for
 * object-position parse correctly.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  test(value)
  {
    var div = document.createElement("div");
    div.setAttribute("style", value);
    document.body.append(div);

    var result = div.style.getPropertyValue("object-position");
    div.remove();
    return result;
  }

  testComputedStyle(value)
  {
    var div = document.createElement("div");
    div.setAttribute("style", value);
    document.body.append(div);

    var result = getComputedStyle(div).getPropertyValue("object-position");
    div.remove();
    return result;
  }

  shouldBeLikeString(testComputedStyle(";"), '50% 50%');
  shouldBeLikeString(testComputedStyle("object-position: 10px;"), '10px 50%');
  shouldBeLikeString(testComputedStyle("object-position: 10px 10px;"), '10px 10px');
  shouldBeLikeString(testComputedStyle("object-position: right top;"), '100% 0%');
  shouldBeLikeString(testComputedStyle("object-position: top right;"), '100% 0%');

  shouldBeLikeString(test("object-position: inherit;"), 'inherit');
  shouldBeLikeString(test("object-position: initial;"), 'initial');
  shouldBeLikeString(test("object-position: left;"), 'left center');
  shouldBeLikeString(test("object-position: top;"), 'center top');
  shouldBeLikeString(test("object-position: top right;"), 'right top');
  shouldBeLikeString(test("object-position: right top;"), 'right top');
  shouldBeLikeString(test("object-position: center center;"), 'center center');
  shouldBeLikeString(test("object-position: center;"), 'center center');
  shouldBeLikeString(test("object-position: bottom center;"), 'center bottom');
  shouldBeLikeString(test("object-position: left center;"), 'left center');
  shouldBeLikeString(test("object-position: bottom center;"), 'center bottom');
  shouldBeLikeString(test("object-position: center left;"), 'left center');
  shouldBeLikeString(test("object-position: center bottom;"), 'center bottom');
  shouldBeLikeString(test("object-position: 100px;"), '100px center');
  shouldBeLikeString(test("object-position: 100px 100px;"), '100px 100px');
  shouldBeLikeString(test("object-position: 100px 200px;"), '100px 200px');
  shouldBeLikeString(test("object-position: -50% 0;"), '-50% 0px');
  shouldBeLikeString(test("object-position: 3em 0;"), '3em 0px');
  shouldBeLikeString(test("object-position: left 33px;"), 'left 33px');
  shouldBeLikeString(test("object-position: center 33px;"), 'center 33px');
  shouldBeLikeString(test("object-position: 33px center;"), '33px center');
  shouldBeLikeString(test("object-position: 33px bottom;"), '33px bottom');
  shouldBeLikeString(test("object-position: 1vh 1vw;"), '1vh 1vw');

  shouldBeNull(x) => shouldBe(x, '');

  shouldBeNull(test("object-position: 100px 100px 100px;"));
  shouldBeNull(test("object-position: 100px 100px 200px 200px;"));
  shouldBeNull(test("object-position: top left center;"));
  shouldBeNull(test("object-position: top top;"));
  shouldBeNull(test("object-position: top bottom;"));
  shouldBeNull(test("object-position: 33px left;"));
  shouldBeNull(test("object-position: top 33px;"));
  shouldBeNull(test("object-position: inherit inherit;"));
  shouldBeNull(test("object-position: initial initial;"));
  shouldBeNull(test("object-position: -webkit-fill-available;"));
  shouldBeNull(test("object-position: min-content;"));
  shouldBeNull(test("object-position: intrinsic;"));
  shouldBeNull(test("object-position: auto;"));
  shouldBeNull(test("object-position: none;"));
  shouldBeNull(test("object-position: fill;"));
}
