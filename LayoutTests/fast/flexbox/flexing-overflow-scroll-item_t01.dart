/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "../../resources/check-layout.dart";

main() {
  document.body.setInnerHtml('''
      <div id="flexbox" style="display: -webkit-box; height: 100px; width: 200px;">
          <div style="overflow: scroll; -webkit-box-flex: 1;" data-expected-width=200 data-expected-height=100></div>
      </div>

      <div id="flexbox" style="display: -webkit-box; height: 100px; width: 200px; -webkit-box-orient: vertical;">
          <div style="overflow: scroll; -webkit-box-flex: 1;" data-expected-width=200 data-expected-height=100></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  checkLayout('#flexbox');
}
