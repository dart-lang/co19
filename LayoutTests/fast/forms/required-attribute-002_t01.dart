/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description required attribute set
 * @static-warning
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <p id="description"></p>
      <div id="console"></div>
      <input id="input" name="victim" />
      <textarea id="textarea" name="victim"></textarea>
      <select id="select" name="victim">
        <option value="" selected />
        <option value="X">X</option>
      </select>
      ''', treeSanitizer: new NullTreeSanitizer());

  requiredFor(id) {
    return document.getElementById(id).required;
  }

  var v = document.getElementsByName("victim");

  debug("Before set:");
  shouldBeFalse(requiredFor("input"));
  shouldBeFalse(requiredFor("textarea"));
  shouldBeFalse(requiredFor("select"));
  debug("");

  v[0].required = true;
  v[1].required = true;
  v[2].required = true;

  debug("After set:");
  shouldBeTrue(requiredFor("input"));
  shouldBeTrue(requiredFor("textarea"));
  shouldBeTrue(requiredFor("select"));
  debug("");
}
