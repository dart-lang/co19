/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests parsing invalid XHTML content in innerHtml.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var doc = new DomParser()
    .parseFromString('''
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<body>
<p>createContextualFragment: <span id="createContextualFragment">FAIL</span></p>
<p>insertAdjacentHtml: <span id="insertAdjacentHtml">FAIL</span></p>
<p>innerHtml: <span id="innerHtml">FAIL</span></p>
</body>
</html>
      ''', 'text/xml');

  var div = doc.createElement('div');
  //doc.body.append(div);
  doc.querySelector('body').append(div);

  var range = doc.createRange();
  range.selectNode(div);
  try {
    range.createContextualFragment('<b>a<');
  } catch (exception) {
    doc.getElementById('createContextualFragment').text = 'PASS - ' + exception.name;
    shouldBe(exception.name, DomException.SYNTAX);
  }

  try {
    div.insertAdjacentHtml('afterBegin', '<b>a<');
  } catch (exception) {
    doc.getElementById('insertAdjacentHtml').text = 'PASS - ' + exception.name;
    shouldBe(exception.name, DomException.SYNTAX);
  }

  try {
    div.innerHtml = '<b>a<';
  } catch (exception) {
    doc.getElementById('innerHtml').text = 'PASS - ' + exception.name;
    shouldBe(exception.name, DomException.SYNTAX);
  }
}

