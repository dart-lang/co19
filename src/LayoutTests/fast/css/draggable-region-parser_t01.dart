/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This tests the parser and serializer for draggable region values.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  document.body.setInnerHtml('''
      <p id="description"></p>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  description("This tests the parser and serializer for draggable region values.");

  var style = document.getElementById('description').style;

  parseDraggableRegion(string)
  {
    try {
      style.removeProperty("-webkit-app-region");
      style.setProperty("-webkit-app-region", string, "");
      var result = style.getPropertyValue("-webkit-app-region");
      style.removeProperty("-webkit-app-region");
      return result;
    } catch (e) {
      return "" + e;
    }
  }

  debug('');

  shouldBe(parseDraggableRegion('drag'), 'drag');
  shouldBe(parseDraggableRegion('no-drag'), 'no-drag');

  debug('');
  debug('Tests for variations in whitespace that are allowed.');
  debug('');

  shouldBe(parseDraggableRegion('  drag  '), 'drag');
  shouldBe(parseDraggableRegion('  no-drag    '), 'no-drag');

  debug('');
  debug('Tests for case insensitivity.');
  debug('');

  shouldBe(parseDraggableRegion('Drag'), 'drag');
  shouldBe(parseDraggableRegion('DrAG'), 'drag');
  shouldBe(parseDraggableRegion('NO-DrAG'), 'no-drag');
  shouldBe(parseDraggableRegion('NO-DRAG'), 'no-drag');

  debug('');
  debug('Some expected failures.');
  debug('');

  var expected = '';
  shouldBe(parseDraggableRegion(''), expected);
  shouldBe(parseDraggableRegion(' '), expected);
  shouldBe(parseDraggableRegion('x'), expected);
  shouldBe(parseDraggableRegion('x-'), expected);
  shouldBe(parseDraggableRegion('x()'), expected);
  shouldBe(parseDraggableRegion('x(a)'), expected);
  shouldBe(parseDraggableRegion('none x'), expected);
  shouldBe(parseDraggableRegion('none x()'), expected);
  shouldBe(parseDraggableRegion('none x(a)'), expected);

  debug('');
}
