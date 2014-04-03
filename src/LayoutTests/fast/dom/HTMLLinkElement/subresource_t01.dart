/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests if link prefetches are enabled
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";

main() {
  var root = '/root_dart/tests/co19/src/LayoutTests/fast/dom/HTMLLinkElement';

  document.body.setInnerHtml('''
    <link href="$root/prefetch.link" rel="prefetch"/>
    ''', treeSanitizer: new NullTreeSanitizer());

  var link = document.body.querySelector('link');

  link.onLoad.listen((_) => testPassed('onload'));
  link.onError.listen((_) => testFailed('onerror'));
}

