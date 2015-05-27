/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that content within template is lifted to the
 * template contents when parsed as xhtml.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var doc = new DomParser()
    .parseFromString('''
<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xml:lang="en-us" xmlns="http://www.w3.org/1999/xhtml">
    <body>
        <template><div>Template content</div></template>
        <span>This tests that content within template is lifted to the template contents when parsed as xhtml.</span>
        ''', 'text/xml');

  var template = doc.querySelector("template");
  shouldBeTrue(template.content.childNodes.length > template.childNodes.length);

  var text = new XmlSerializer().serializeToString(template);
  shouldBe(text, '<template xmlns="http://www.w3.org/1999/xhtml"><div>Template content</div></template>');
}
