/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test makes sure that we have similar behavior as other
 * browsers when resizing and moving a window outside of the window.screen. This test
 * will fail in some dimensions when run manually because of inconsistencies of  * when the window can and cannot go behind the doc.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  window.moveTo(new Point(0,0));

  var result;
  var testName;
  var x;
  var y;

  // resizeTo /////////////////////////
  debug('window.resizeTo Tests');

  x = window.screen.width*2;
  y = window.screen.height*2;
  window.resizeTo(x, y);
  debug("Testing - resizeTo: Too Big");
  shouldBe(window.outerWidth, window.screen.available.width);

  x = 50;
  y = 50;
  window.resizeTo(x, y);
  debug("Testing - resizeTo: Too Small");
  shouldBe(window.outerWidth, 100);

  x = window.screen.width/10;
  y = window.screen.height/10;
  window.moveTo(new Point(x, y));
  x = window.screen.width;
  y = window.screen.height;
  window.resizeTo(x, y);
  debug("Testing - resizeTo: Full Screen Out of Bounds");
  shouldBe(window.screenY, window.screen.available.top);
  shouldBe(window.outerHeight, window.screen.available.height);
  shouldBe(window.screenX, window.screen.available.left);
  shouldBe(window.outerWidth, window.screen.available.width);

  x = 100;
  y = 100;
  window.resizeTo(x, y);
  x = window.screen.width/2;
  y = window.screen.height/2;
  window.moveTo(new Point(x, y));
  x += 10;
  y += 10;
  window.resizeTo(x, y);
  debug("Testing - resizeTo: Not Full Screen Out of Bounds");
  shouldBeApprox(window.outerHeight + window.screenY - window.screen.available.top, window.screen.available.height, 1);
  shouldBeApprox(window.outerWidth + window.screenX - window.screen.available.left, window.screen.available.width, 1);

  // resizeBy /////////////////////////
  debug('window.resizeBy Tests');

  x = 150;
  y = 150;
  window.resizeTo(x, y);
  x = -100;
  y = -100;
  window.resizeBy(x, y);
  debug("Testing - resizeBy: Too Small");
  shouldBe(window.outerWidth, 100);


  x = window.screen.width*2;
  y = window.screen.height*2;
  window.resizeBy(x, y);
  debug("Testing - resizeBy: Too Big");
  shouldBe(window.outerWidth, window.screen.available.width);

  window.moveTo(new Point(0,0));
  window.resizeTo(window.screen.width, window.screen.height);

  // moveTo /////////////////////////
  debug('window.moveTo Tests');

  x = -100;
  y = -100;
  window.moveTo(new Point(x, y));
  debug("Testing - moveTo: Top Left");
  shouldBe(window.screenY, window.screen.available.top);
  shouldBe(window.screenX, window.screen.available.left);

  x = 0;
  y = -100;
  window.moveTo(new Point(x, y));
  debug("Testing - moveTo: Top");
  shouldBe(window.screenY, window.screen.available.top);
  shouldBe(window.screenX, window.screen.available.left);

  x = 100;
  y = -100;
  window.moveTo(new Point(x, y));
  debug("Testing - moveTo: Top Right");
  shouldBe(window.screenY, window.screen.available.top);
  shouldBe(window.outerWidth, window.screen.available.width);

  x = 100;
  y = 0;
  window.moveTo(new Point(x, y));
  debug("Testing - moveTo: Right");
  shouldBe(window.screenY, window.screen.available.top);
  shouldBe(window.outerWidth, window.screen.available.width);

  x = 100;
  y = 100;
  window.moveTo(new Point(x, y));
  debug("Testing - moveTo: Bottom Right");
  shouldBe(window.outerHeight, window.screen.available.height);
  shouldBe(window.outerWidth, window.screen.available.width);

  x = 0;
  y = 100;
  window.moveTo(new Point(x, y));
  debug("Testing - moveTo: Bottom");
  shouldBe(window.outerHeight, window.screen.available.height);
  shouldBe(window.screenX, window.screen.available.left);

  x = -100;
  y = 100;
  window.moveTo(new Point(x, y));
  debug("Testing - moveTo: Bottom Left");
  shouldBe(window.outerHeight, window.screen.available.height);
  shouldBe(window.screenX, window.screen.available.left);

  x = -100;
  y = 0;
  window.moveTo(new Point(x, y));
  debug("Testing - moveTo: Left");
  shouldBe(window.screenY, window.screen.available.top);
  shouldBe(window.screenX, window.screen.available.left);

  window.moveTo(new Point(0,0));
  window.resizeTo(window.screen.width, window.screen.height);

  // moveBy /////////////////////////
  debug('window.moveBy Tests');

  x = 100;
  y = 100;
  window.resizeTo(x, y);

  x = 200;
  y = 200;
  window.moveTo(new Point(x, y));

  var previousScreenX = window.screenX;
  var previousScreenY = window.screenY;

  x = 0;
  y = 0;
  window.moveBy(x, y);
  debug("Testing - moveBy: Zero Zero");
  shouldBeTrue(window.screenX == previousScreenX);
  shouldBeTrue(window.screenY == previousScreenY);

  previousScreenX = window.screenX;
  previousScreenY = window.screenY;
  x = 1;
  y = 0;
  window.moveBy(x, y);
  debug("Testing - moveBy: One Zero");
  shouldBeTrue(window.screenX == previousScreenX + 1);
  shouldBeTrue(window.screenY == previousScreenY);

  previousScreenX = window.screenX;
  previousScreenY = window.screenY;
  x = 0;
  y = 1;
  window.moveBy(x, y);
  debug("Testing - moveBy: Zero One");
  shouldBeTrue(window.screenX == previousScreenX);
  shouldBeTrue(window.screenY == previousScreenY + 1);

  window.moveTo(new Point(0,0));
  window.resizeTo(window.screen.width, window.screen.height);

  x = -100;
  y = -100;
  window.moveBy(x, y);
  debug("Testing - moveBy: Top Left");
  shouldBe(window.screenY, window.screen.available.top);
  shouldBe(window.screenX, window.screen.available.left);

  x = 0;
  y = -100;
  window.moveBy(x, y);
  debug("Testing - moveBy: Top");
  shouldBe(window.screenY, window.screen.available.top);
  shouldBe(window.screenX, window.screen.available.left);

  x = 100;
  y = -100;
  window.moveBy(x, y);
  debug("Testing - moveBy: Top Right");
  shouldBe(window.screenY, window.screen.available.top);
  shouldBe(window.outerWidth, window.screen.available.width);

  x = 100;
  y = 0;
  window.moveBy(x, y);
  debug("Testing - moveBy: Right");
  shouldBe(window.screenY, window.screen.available.top);
  shouldBe(window.outerWidth, window.screen.available.width);

  x = 100;
  y = 100;
  window.moveBy(x, y);
  debug("Testing - moveBy: Bottom Right");
  shouldBe(window.outerHeight, window.screen.available.height);
  shouldBe(window.outerWidth, window.screen.available.width);

  x = 0;
  y = 100;
  window.moveBy(x, y);
  debug("Testing - moveBy: Bottom");
  shouldBe(window.outerHeight, window.screen.available.height);

  x = -1000;
  y = 100;
  window.moveBy(x, y);
  debug("Testing - moveBy: Bottom Left");
  shouldBe(window.outerHeight, window.screen.available.height);
  shouldBe(window.screenX, window.screen.available.left);

  x = -100;
  y = 0;
  window.moveBy(x, y);
  debug("Testing - moveBy: Left");
  shouldBe(window.screenX, window.screen.available.left);

  window.moveTo(new Point(0,0));
  window.resizeTo(800,600);
}
