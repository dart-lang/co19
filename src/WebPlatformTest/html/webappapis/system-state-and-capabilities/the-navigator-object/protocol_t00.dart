/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * after web-platform-tests/html/webappapis/system-state-and-capabilities/the-navigator-object/protocol.html
 * @assertion
 * @description registerProtocolHandler() 
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL = r'''
<p><strong>Note:</strong> If your browser limits the number of handler
registration requests on a page, you might need to disable or significantly
increase that limit for the tests below to run.</p>
''';

void main() {
    document.body.appendHtml(htmlEL);
    Navigator navigator = window.navigator;
    Location location = window.location;
    
    test(() {
    	navigator.registerProtocolHandler('tel', location.href + '/%s', 'foo');
    }, 'a handler with valid arguments should work');
    
    
    /* URL argument */
    test(() {
    	navigator.registerProtocolHandler('tel', '%s', 'foo');
    }, 'a relative URL should work');
    
    test(() {
    	navigator.registerProtocolHandler('tel', location.href + '#%s', 'foo');
    }, 'a URL with a fragment identifier should work');
    
    test(() {
    	navigator.registerProtocolHandler('tel', location.href + '?foo=%s', 'foo');
    }, 'a URL with a query string should work');
    
    test(() {
    	navigator.registerProtocolHandler('tel', location.href + '?foo=%s&bar', 'foo');
    }, 'a URL with a multi-argument query string should work');
    
    test(() {
    	navigator.registerProtocolHandler('tel', location.href + '/%s/bar/baz/', 'foo');
    }, 'a URL with the passed string as a directory name should work');
    
    test(() {
    	navigator.registerProtocolHandler('tel', location.href + '/%s/bar/baz/?foo=1337&bar#baz', 'foo');
    }, 'a URL with the passed string as a directory name followed by a query string and fragment identifier should work');
    
    test(() {
    	navigator.registerProtocolHandler('tel', location.href + '/%s/foo/%s/', 'foo');
    }, 'a URL with the passed string included twice should work');
    
    test(() {
    	assert_throws('SyntaxError', () { navigator.registerProtocolHandler('mailto', '', 'foo'); } );
    }, 'an empty url argument should throw SyntaxError');
    
    test(() {
    	assert_throws('SyntaxError', () { navigator.registerProtocolHandler('mailto', 'http://%s.com', 'foo'); } );
    }, '%s instead of domain name should throw SyntaxError');
    
    test(() {
    	assert_throws('SyntaxError', () { navigator.registerProtocolHandler('mailto', 'http://%s.example.com', 'foo'); } );
    }, '%s instead of subdomain name should throw SyntaxError');
    
    test(() {
    	assert_throws('SyntaxError', () { navigator.registerProtocolHandler('mailto', location.href + '', 'foo'); } );
    }, 'a url argument without %s should throw SyntaxError');
    
    test(() {
    	assert_throws('SyntaxError', () { navigator.registerProtocolHandler('mailto', 'http://example.com', 'foo'); } );
    }, 'a url argument pointing to a different domain name, without %s should throw SyntaxError');
    
    test(() {
    	assert_throws('SyntaxError', () { navigator.registerProtocolHandler('mailto', location.href + '/%', 'foo'); } );
    }, 'a url argument without %s (but with %) should throw SyntaxError');
    
    test(() {
    	assert_throws('SyntaxError', () { navigator.registerProtocolHandler('mailto', location.href + '/%a', 'foo'); } );
    }, 'a url argument without %s (but with %a) should throw SyntaxError');
    
    test(() {
    	assert_throws('SecurityError', () { navigator.registerProtocolHandler('mailto', 'http://example.com/%s', 'foo'); } );
    }, 'a url argument pointing to a different domain name should throw SecurityError');
    
    test(() {
    	assert_throws('SecurityError', () { navigator.registerProtocolHandler('mailto', 'https://example.com/%s', 'foo'); } );
    }, 'a url argument pointing to a different domain name should throw SecurityError (2)');
    
    test(() {
    	assert_throws('SecurityError', () { navigator.registerProtocolHandler('mailto', 'http://foobar.example.com/%s', 'foo'); } );
    }, 'a url argument pointing to a different domain name should throw SecurityError (3)');
    
    test(() {
    	assert_throws('SecurityError', () { navigator.registerProtocolHandler('mailto', 'mailto:%s@example.com', 'foo'); } );
    }, 'looping handlers should throw SecurityError');
    
    test(() {
    	assert_throws('SecurityError', () { navigator.registerProtocolHandler('sms', 'tel:%s', 'foo'); } );
    }, 'a url argument pointing to a non-http[s] scheme should throw SecurityError due to not being of the same origin');
    
    /* Protocol argument */
    test(() {
    	assert_throws('SyntaxError', () { navigator.registerProtocolHandler('unrecognized', location.href + '/%a', 'foo'); } );
    }, 'a protocol argument containing an unrecognized scheme should throw SecurityError'); /* This is a whitelist, not a blacklist. */
    
    test(() {
    	assert_throws('SyntaxError', () { navigator.registerProtocolHandler('mailto:', location.href + '/%a', 'foo'); } );
    }, 'a protocol argument containing : should throw SyntaxError');
    
    test(() {
    	assert_throws('SyntaxError', () { navigator.registerProtocolHandler('mailto://', location.href + '/%a', 'foo'); } );
    }, 'a protocol argument containing :// should throw SyntaxError');
    
    test(() {
    	assert_throws('SyntaxError', () { navigator.registerProtocolHandler('http://', location.href + '/%a', 'foo'); } );
    }, 'a protocol argument containing http:// should throw SyntaxError');
    
    test(() {
    	assert_throws('SyntaxError', () {
    	  navigator.registerProtocolHandler('mailto' + new String.fromCharCode(0), location.href + '/%a', 'foo');
        } );
    }, 'a protocol argument containing a null character should throw SyntaxError');
    
    test(() {
    	assert_throws('SyntaxError', () {
    	  navigator.registerProtocolHandler('mailtoo' + new String.fromCharCode(8), location.href + '/%a', 'foo');
        } );
    }, 'a protocol argument containing a backspace character should throw SyntaxError');
    
    test(() {
    	assert_throws('SyntaxError', () {
    	  navigator.registerProtocolHandler('mailto' + new String.fromCharCode(10), location.href + '/%a', 'foo');
    	} );
    }, 'a protocol argument containing a LF character should throw SyntaxError');
    
    test(() {
    	assert_throws('SyntaxError', () {
    	  navigator.registerProtocolHandler('mаilto', location.href + '/%a', 'foo');
    	} );
    }, 'a protocol argument containing non-alphanumeric characters (like a cyrillic “а”) should throw SyntaxError');
    
    test(() {
    	navigator.registerProtocolHandler('TEL', location.href + '/%s', 'foo');
    }, 'a protocol argument of “TEL” should be equivalent to “tel”');
    
    test(() {
    	navigator.registerProtocolHandler('teL', location.href + '/%s', 'foo');
    }, 'a protocol argument of “teL” should be equivalent to “tel”');
    
    
    /* Overriding any of the following protocols must never be allowed. That would
     * break the browser. */
    var blacklist = [
    	'about',
    	'attachment',
    	'blob',
    	'chrome',
    	'cid',
    	'data',
    	'file',
    	'ftp',
    	'http',
    	'https',
    	'javascript',
    	'livescript',
    	'mid',
    	'mocha',
    	'opera',
    	'operamail',
    	'res',
    	'resource',
    	'shttp',
    	'tcl',
    	'vbscript',
    	'view-source',
    	'ws',
    	'wss',
    	'wyciwyg'];
    
    for ( var bi=0, bl=blacklist.length; bi<bl; ++bi ){
    
    	test(() {
    		assert_throws('SecurityError', () {
    		   navigator.registerProtocolHandler(blacklist[bi], location.href + '/%s', 'foo');
    		} );
    	}, 'attempting to override the ' + blacklist[bi] + ' protocol should throw SecurityError');
    
    }
    
    /* The following protocols must be possible to override.
     * We're just testing that the call goes through here. Whether or not they
     * actually work as handlers is covered by the interactive tests. */
    var whitelist = [
    	'geo',
    	'im',
    	'irc',
    	'ircs',
    	'mailto',
    	'mms',
    	'news',
    	'nntp',
    	'sms',
    	'smsto',
    	'tel',
    	'urn',
    	'webcal',
    	'wtai',
    	'xmpp'];
    
    for ( var wi=0, wl=whitelist.length; wi<wl; ++wi ){
    
    	test(() {
    		navigator.registerProtocolHandler(whitelist[wi], location.href + '/%s', 'foo');
    		assert_true(true);
    	}, 'overriding the ' + whitelist[wi] + ' protocol should work');
    
    }
    
    checkTestFailures();
}

