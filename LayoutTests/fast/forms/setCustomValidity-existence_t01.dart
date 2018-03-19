/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Existence tests for .setCustomValidity property
 */
import "dart:html";
import "../../testcommon.dart";

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
    + '</form>',
    treeSanitizer: new NullTreeSanitizer());

  shouldBeTrue((document.body.querySelector("input") as dynamic).setCustomValidity is Function);
  shouldBeTrue((document.body.querySelector("button") as dynamic).setCustomValidity is Function);
  shouldBeTrue((document.body.querySelector("fieldset") as dynamic).setCustomValidity is Function);
  shouldBeTrue((document.body.querySelector("select") as dynamic).setCustomValidity is Function);
  shouldBeTrue((document.body.querySelector("textarea") as dynamic).setCustomValidity is Function);
  shouldBeTrue((document.body.querySelector("output") as dynamic).setCustomValidity is Function);
  shouldBeTrue((document.body.querySelector("object") as dynamic).setCustomValidity is Function);
}
