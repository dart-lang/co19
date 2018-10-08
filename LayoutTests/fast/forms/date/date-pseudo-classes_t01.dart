/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test if an input field matches to various pseudo classes
 */
import "dart:html";
import "../../../testcommon.dart";
import "../resources/common-pseudo-classes.dart";

main() {
  document.body.setInnerHtml('''
      <div id="container">
      <input type="date" value="1234-12-11" id="enabled">
      <input type="date" value="12340-10-01" id="disabled" disabled>
      <input type="date" value="123456-12-11" min="123456-12-10" step="2" id="invalid">
      <input type="date" value="123456-12-11" min="123456-12-01" max="123456-12-31" id="inrange">
      <input type="date" value="ABC" min="123456-12-01" max="123456-12-31" id="badvalue">
      <input type="date" value="0710-03-10" min="1000-01-01" max="1999-12-31" id="outofrange">
      <input type="date" value="1999-12-31" readonly id="readonly">
      <input type="date" value="1999-12-31" required id="required">
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var container = document.getElementById('container');
  shouldBeTrue(matchedNodesContainId(container, ":enabled", "enabled"));
  shouldBeTrue(matchedNodesContainId(container, ":valid", "enabled"));
  shouldBeTrue(matchedNodesContainId(container, ":optional", "enabled"));
  shouldBeTrue(matchedNodesContainId(container, ":read-write", "enabled"));
  shouldBeTrue(matchedNodesContainId(container, ":disabled", "disabled"));
  shouldBeTrue(matchedNodesContainId(container, ":invalid", "invalid"));
  shouldBeTrue(matchedNodesContainId(container, ":in-range", "inrange"));
  shouldBeTrue(matchedNodesContainId(container, ":in-range", "badvalue"));
  shouldBeTrue(matchedNodesContainId(container, ":out-of-range", "outofrange"));
  shouldBeTrue(matchedNodesContainId(container, ":read-only", "readonly"));
  shouldBeTrue(matchedNodesContainId(container, ":required", "required"));
  // Make the id=outofrange element in-range state.
  (document.getElementById('outofrange') as InputElement).value = '1500-01-01';
  shouldBeFalse(matchedNodesContainId(container, ":out-of-range", "outofrange"));
  shouldBeTrue(matchedNodesContainId(container, ":in-range", "outofrange"));
  // Make the id=inrange element out-of-range state.
  (document.getElementById('inrange') as InputElement).value = '1500-01-01';
  shouldBeFalse(matchedNodesContainId(container, ":in-range", "inrange"));
  shouldBeTrue(matchedNodesContainId(container, ":out-of-range", "inrange"));
  container.remove();
}
