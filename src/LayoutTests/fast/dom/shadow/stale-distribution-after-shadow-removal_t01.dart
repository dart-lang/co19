/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that stale distribution data stored in the ElementShadow
 * is not used. Passes if it does not crash or assert
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="host"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var host = document.getElementById('host');
  var oldestShadowRoot = host.createShadowRoot();
  var youngestShadowRoot = host.createShadowRoot();

  oldestShadowRoot.innerHtml = '';
  youngestShadowRoot.innerHtml = '<shadow></shadow>';

  // Cause a distribution to populate the ElementShadow.
  host.offsetLeft;

  // Create a stale pointer to the HtmlShadowElement.
  youngestShadowRoot.innerHtml = '';

  // Trigger a sync attach() from innerHtml. The sync attach skips the
  // recalcDistribution call and would access stale data.
  oldestShadowRoot.innerHtml = '<span></span>';
}
