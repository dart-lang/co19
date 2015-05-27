/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for edge cases of <textarea> rows and cols attributes.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var parent = document.createElement('div');
  document.body.append(parent);
  parent.innerHtml = '<textarea>default</textarea>';

  debug('Default values');
  var textarea = parent.firstChild;
  var defaultRows = textarea.rows;
  var defaultCols = textarea.cols;
  var defaultHeight = textarea.offsetHeight;
  var defaultWidth = textarea.offsetWidth;
  shouldBe(defaultRows, 2);
  shouldBe(defaultCols, 20);
  shouldBeTrue(defaultHeight > 0);
  shouldBeTrue(defaultWidth > 0);

  debug('rows = 1');
  parent.innerHtml = '<textarea rows="1">rows = 1</textarea>';
  textarea = parent.firstChild;
  shouldBe(textarea.rows, 1);
  shouldBeTrue(textarea.offsetHeight > 0);
  shouldBeTrue(textarea.offsetHeight < defaultHeight);
  shouldBe(textarea.offsetWidth, defaultWidth);

  debug('rows = 2; should match default height');
  parent.innerHtml = '<textarea rows="2">rows = 2; should match default height</textarea>';
  textarea = parent.firstChild;
  shouldBe(textarea.rows, defaultRows);
  shouldBe(textarea.offsetHeight, defaultHeight);
  shouldBe(textarea.offsetWidth, defaultWidth);

  debug('rows = 3');
  parent.innerHtml = '<textarea rows="3">rows = 3</textarea>';
  textarea = parent.firstChild;
  shouldBe(textarea.rows, 3);
  shouldBeTrue(textarea.offsetHeight > defaultHeight);
  shouldBe(textarea.offsetWidth, defaultWidth);

  debug('rows; should be default height');
  parent.innerHtml = '<textarea rows>rows; should be default height</textarea>';
  textarea = parent.firstChild;
  shouldBe(textarea.rows, defaultRows);
  shouldBe(textarea.offsetHeight, defaultHeight);
  shouldBe(textarea.offsetWidth, defaultWidth);

  debug('rows = 0; should be default height');
  parent.innerHtml = '<textarea rows="0">rows = 0; should be default height</textarea>';
  textarea = parent.firstChild;
  shouldBe(textarea.rows, defaultRows);
  shouldBe(textarea.offsetHeight, defaultHeight);
  shouldBe(textarea.offsetWidth, defaultWidth);

  debug('rows = -1; should be default height');
  parent.innerHtml = '<textarea rows="-1">rows = -1; should be default height</textarea>';
  textarea = parent.firstChild;
  shouldBe(textarea.rows, defaultRows);
  shouldBe(textarea.offsetHeight, defaultHeight);
  shouldBe(textarea.offsetWidth, defaultWidth);

  debug('rows = x; should be default height');
  parent.innerHtml = '<textarea rows="x">rows = x; should be default height</textarea>';
  textarea = parent.firstChild;
  shouldBe(textarea.rows, defaultRows);
  shouldBe(textarea.offsetHeight, defaultHeight);
  shouldBe(textarea.offsetWidth, defaultWidth);

  debug('cols = 1');
  parent.innerHtml = '<textarea cols="1">cols = 1</textarea>';
  textarea = parent.firstChild;
  shouldBe(textarea.cols, 1);
  shouldBeTrue(textarea.offsetWidth > 0);
  shouldBeTrue(textarea.offsetWidth < defaultWidth);
  shouldBe(textarea.offsetHeight, defaultHeight);

  debug('cols = 20; should match default width');
  parent.innerHtml = '<textarea cols="20">cols = 20; should match default width</textarea>';
  textarea = parent.firstChild;
  shouldBe(textarea.cols, defaultCols);
  shouldBe(textarea.offsetWidth, defaultWidth);
  shouldBe(textarea.offsetHeight, defaultHeight);

  debug('cols = 40');
  parent.innerHtml = '<textarea cols="40">cols = 40</textarea>';
  textarea = parent.firstChild;
  shouldBe(textarea.cols, 40);
  shouldBeTrue(textarea.offsetWidth > defaultWidth);
  shouldBe(textarea.offsetHeight, defaultHeight);

  debug('cols; should be default width');
  parent.innerHtml = '<textarea cols>cols; should be default width</textarea>';
  textarea = parent.firstChild;
  shouldBe(textarea.cols, defaultCols);
  shouldBe(textarea.offsetWidth, defaultWidth);
  shouldBe(textarea.offsetHeight, defaultHeight);

  debug('cols = 0; should be default width');
  parent.innerHtml = '<textarea cols="0">cols = 0; should be default width</textarea>';
  textarea = parent.firstChild;
  shouldBe(textarea.cols, defaultCols);
  shouldBe(textarea.offsetWidth, defaultWidth);
  shouldBe(textarea.offsetHeight, defaultHeight);

  debug('cols = -1; should be default width');
  parent.innerHtml = '<textarea cols="-1">cols = -1; should be default width</textarea>';
  textarea = parent.firstChild;
  shouldBe(textarea.cols, defaultCols);
  shouldBe(textarea.offsetWidth, defaultWidth);
  shouldBe(textarea.offsetHeight, defaultHeight);

  debug('cols = x; should be default width');
  parent.innerHtml = '<textarea cols="x">cols = x; should be default width</textarea>';
  textarea = parent.firstChild;
  shouldBe(textarea.cols, defaultCols);
  shouldBe(textarea.offsetWidth, defaultWidth);
  shouldBe(textarea.offsetHeight, defaultHeight);
}
