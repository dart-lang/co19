/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description required attribute presence test
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      <input id="input" name="victim" required />
      <textarea id="textarea" name="victim" required></textarea>
      <select id="select" name="victim" required>
        <option value="" selected />
        <option value="X">X</option>
      </select>
      ''', treeSanitizer: new NullTreeSanitizer());

  bool requiredFor(String id) {
    return (document.getElementById(id) as dynamic).required;
  }

  shouldBeTrue(requiredFor("input"));
  shouldBeTrue(requiredFor("textarea"));
  shouldBeTrue(requiredFor("select"));
}
