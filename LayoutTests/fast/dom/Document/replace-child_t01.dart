/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that various combinations of replaceChild on the 
 * document works as specified.
 * @note Uses Node.replaceWith instead of document.replaceChild
 * @needsreview it's unclear whether marked tests should throw
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
    var parser = new DomParser();
    var serializer = new XmlSerializer();
    var doc, newChild, fragment;

    dumpDocument() {
      escapeHTML(serializer.serializeToString(doc)) + '<br>';
    }

    test(testName, testFunc()) {
      try {
        testFunc();
        dumpDocument();
      } catch (e) {
        throw '$testName: $e';
      }
    }

    test('replacing element with element', () {
        doc = parser.parseFromString('<!DOCTYPE html><body/>', 'text/xml');
        newChild = doc.createElement('div');
        
        doc.documentElement.replaceWith(newChild);
    });

    test('replacing element with element in fragment', () {        
        doc = parser.parseFromString('<!DOCTYPE html><body/>', 'text/xml');
        fragment = doc.createDocumentFragment();
        fragment.append(doc.createElement('div'));

        // should throw?
        doc.documentElement.replaceWith(fragment);
    });

    test('replacing element with multiple elements in fragment', () {
        doc = parser.parseFromString('<!DOCTYPE html><body/>', 'text/xml');
        fragment = doc.createDocumentFragment();
        fragment.append(doc.createElement('div'));
        fragment.append(doc.createElement('span'));
        
        doc.documentElement.replaceWith(fragment);
    });

    test('replacing element with doctype', () {
        doc = parser.parseFromString('<body/>', 'text/xml');
        newChild = doc.implementation.createDocumentType('svg',
          '-//W3C//DTD SVG 1.1//EN',
          'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd');
        
        doc.documentElement.replaceWith(newChild);
    });

    test('replacing element with doctype when a doctype already exists', () {
        doc = parser.parseFromString('<!DOCTYPE html><body/>', 'text/xml');
        newChild = doc.implementation.createDocumentType('svg',
          '-//W3C//DTD SVG 1.1//EN',
          'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd');
        
        // should throw?
        doc.documentElement.replaceWith(newChild);
    });

    /*test('replacing doctype with doctype', () {
        doc = parser.parseFromString('<!DOCTYPE html><body/>', 'text/xml');
        newChild = doc.implementation.createDocumentType(
          'svg',
          '-//W3C//DTD SVG 1.1//EN',
          'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd');
        
        doc.doctype.replaceWith(newChild);
    });*/

    /*test('replacing doctype with element', () {
        doc = parser.parseFromString('<!DOCTYPE html><body/>', 'text/xml');
        doc.documentElement.remove();
        newChild = doc.createElement('bar');

        doc.doctype.replaceWith(newChild);
    });*/

    test('replacing element with doctype when an element already exists', () {
        doc = parser.parseFromString('<!DOCTYPE html><body/>', 'text/xml');
        newChild = doc.implementation.createDocumentType(
          'svg',
          '-//W3C//DTD SVG 1.1//EN',
          'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd');

        // should throw?
        doc.documentElement.replaceWith(newChild);
    });
}
