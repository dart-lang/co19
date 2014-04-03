/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test passes if it doesn't crash.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";

main() {
  var root = '/root_dart/tests/co19/src/LayoutTests/fast/dom/HTMLLinkElement';

  document.body.setInnerHtml('''
    <html>
    <div id="frag"></div>
    </html>
    ''', treeSanitizer: new NullTreeSanitizer());

  // Fun with innerHTML.
  document.getElementById('frag').setInnerHtml(
      '<link href="$root/prefetch.link" rel="prefetch">',
      treeSanitizer: new NullTreeSanitizer());

  // Fun with detached documents.
  var doc = document.implementation
    .createDocument('application/html+xml', 'html', null);
  var lnk = doc.createElement('link');
  lnk.setAttribute('rel', 'prefetch');
  lnk.setAttribute('href', '$root/prefetch.link');
  doc.documentElement.append(lnk);
}
