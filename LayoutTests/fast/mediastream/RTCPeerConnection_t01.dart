/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Tests the RTCPeerConnection constructor.
 */
import "dart:html";

void main() {
    new RtcPeerConnection(null);    
    new RtcPeerConnection(null, null);    

    new RtcPeerConnection({"iceServers":[]}, null);    
    new RtcPeerConnection({"iceServers":[{"url":'stun:foo.com'}]}, null);    
    new RtcPeerConnection({"iceServers":[{"url":'turn:foo.com', "credential":'x'}]}, null);    
    new RtcPeerConnection({"iceServers":[{"url":'turn:foo.com', "credential":'x'},{"url":'stun:bar.com'}]}, null);    
    new RtcPeerConnection({"iceServers":[{"urls":'stun:foo.com'}]}, null);    
    new RtcPeerConnection({"iceServers":[{"urls":['stun:foo.com', 'turn:foo.com']}]}, null);    

    new RtcPeerConnection({"iceServers":[], "iceTransports":'none'}, null);    
    new RtcPeerConnection({"iceServers":[], "iceTransports":'relay'}, null);    
    new RtcPeerConnection({"iceServers":[], "iceTransports":'all'}, null);    

    new RtcPeerConnection(null, {"mandatory":{"valid_and_supported_1":1}});    
    new RtcPeerConnection(null, {"mandatory":{"valid_and_supported_1":1, "valid_and_supported_2":1}});    
    new RtcPeerConnection(null, {"optional":[{"valid_and_supported_1":0}]});    
    new RtcPeerConnection(null, {"optional":[{"valid_and_supported_1":0},{"valid_and_supported_2":0}]});    
    new RtcPeerConnection(null, {"optional":[{"valid_but_unsupported_1":0},{"valid_but_unsupported_2":0}]});    
}