/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that onerror events can be attached to link 
 * elements with rel=prefetch. Since prefetch links are just there as a 
 * performance optimization, the onerror/onload event is their only 
 * programatic side-effect.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <link href="IntentionallyMissingFile.link" rel="prefetch">
    ''', treeSanitizer: new NullTreeSanitizer());

  var link = document.body.querySelector('link');

  link.onLoad.listen((_) => testFailed('onload event should not occur'));
  link.onError.listen((_) => asyncEnd());

  asyncStart();
}
