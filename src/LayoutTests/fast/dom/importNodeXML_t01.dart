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
  var doc = new DomParser()
    .parseFromString('''
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
            <title>importNode</title>
    </head>
    <body>
            <div id="container">
                    <p>This is a simple test of both importNode and cloneNode, created from an example that demonstrated a bug in importNode.</p>
                    <div style="background: yellow;">The original node:</div>
                    <div id="original" style="background: #7F7FFF; padding: 3px">Outer bit<div style="color: yellow; background: blue; margin: 3px;">Inner bit.</div></div>
                    <div style="background: yellow;">Copied with importNode():</div>
                    <div id="cloneTitle" style="background: yellow;">Copied with cloneNode():</div>
            </div>
    </body>
</html>
      ''', 'text/xml');

  var imported = doc.getElementById('container')
    .insertBefore(doc.importNode(doc.getElementById('original'), true), doc.getElementById('cloneTitle'));
  var cloned = doc.getElementById('container')
    .append(doc.getElementById('original').clone(true));

  shouldBe(imported.getAttribute('style'), 'background: #7F7FFF; padding: 3px');
  shouldBe(cloned.getAttribute('style'), 'background: #7F7FFF; padding: 3px');
}



