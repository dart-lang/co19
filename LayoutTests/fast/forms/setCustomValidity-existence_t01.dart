/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Existence tests for .setCustomValidity property
 * @static-warning
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var parent = document.createElement('div');
  document.body.append(parent);

  debug('Existence of .setCustomValidity');
  parent.setInnerHtml('<form>'
    + '<input name="victim"/>'
    + '<textarea name="victim"></textarea>'
    + '<fieldset name="victim">Test</fieldset>'
    + '<button name="victim">'
    + '<select name="victim"></select>'
    + '<output name="victim"></output>'
    + '<object name="victim"></object>'
    + '<keygen name="victim">'
    + '</form>',
    treeSanitizer: new NullTreeSanitizer());

  shouldBeTrue(document.body.query("input").setCustomValidity is Function);
  shouldBeTrue(document.body.query("button").setCustomValidity is Function);
  shouldBeTrue(document.body.query("fieldset").setCustomValidity is Function);
  shouldBeTrue(document.body.query("select").setCustomValidity is Function);
  shouldBeTrue(document.body.query("textarea").setCustomValidity is Function);
  shouldBeTrue(document.body.query("output").setCustomValidity is Function);
  shouldBeTrue(document.body.query("object").setCustomValidity is Function);
  shouldBeTrue(document.body.query("keygen").setCustomValidity is Function);
}
