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

main() {
  document.body.setInnerHtml('''
      <p>
          Test for <i><a href="http://bugs.webkit.org/show_bug.cgi?id=13896">http://bugs.webkit.org/show_bug.cgi?id=13896</a>
          REGRESSION (NativePopup): Reproductible crasher on Google Coop control panel</i>.
      </p>
      <p>
          No crash means SUCCESS.
      </p>
      <select style="display: none;">
          <option style="width: 25ex;"></option>
      </select>

      <select style="display: none;">
          <optgroup style="width: 25ex;">
              <option></option>
          </optgroup>
      </select>

      <select style="display: none;">
          <optgroup>
              <option style="width: 25ex;"></option>
          </optgroup>
      </select>
      ''', treeSanitizer: new NullTreeSanitizer());
}
