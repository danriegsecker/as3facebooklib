/*
	Copyright(c) 2007 Keith Salisbury, Winston Lee
	All rights reserved.
	
	Works derived from AS2 version written by  Tim Whitlock
	
	Please read this Source Code License Agreement carefully before using
	the source code.

	Redistribution and use in source and binary forms, with or without modification,
	are permitted provided that the following conditions are met:

	Redistributions of source code must retain the above copyright notice,
	this list of conditions and the following disclaimer.

	Redistributions in binary form must reproduce the above copyright notice,
	this list of conditions and the following disclaimer in the documentation
	and/or other materials provided with the distribution.

	Neither the name of the original author nor the names of contributors
	may be used to endorse or promote products derived from this software
	without specific prior written permission.
	
	THIS SOURCE CODE IS PROVIDED "AS IS" AND "WITH ALL FAULTS", WITHOUT 
	ANY TECHNICAL SUPPORT OR ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING,
	BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
	FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  ALSO, THERE IS NO WARRANTY OF 
	NON-INFRINGEMENT, TITLE OR QUIET ENJOYMENT.  IN NO EVENT SHALL MACROMEDIA
	OR ITS SUPPLIERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
	EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
	PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
	OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
	WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR 
	OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOURCE CODE, EVEN IF
	ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

// THIS CODE IS AN EXAMPLE PULLED FROM LIVEDOCS::PROXY

/*

THE INTENTION IS THAT THIS FILE WILL REPRESENT THE FOLLOWING PYTHON CODE

class FacebookProxy:
    """
    FacebookProxy represents either a Facebook API call and/or a Facebook API "object" of API calls.
    """

    def __init__(self, client, path):
        self._client = client
        self._path = path

    def __str__(self):
        return self._path

    def __repr__(self):
        return "<FacebookProxy: %s>" % (self._path)

    def __call__(self, **args):
        if not self._client.session_key:
            raise RuntimeError("Session key not yet set. Make sure auth.getSession has been called.")
        args["method"] = self._path
        args['session_key'] = self._client.session_key
        args['call_id'] = str(int(time.time()) * 1000)
        return self._client._do_request(False, args)

    def __getattr__(self, attr, **args):
        self.__dict__[attr] = FacebookProxy(self._client, self._path + "." + attr)
        return self.__dict__[attr]

class AuthFacebookProxy(FacebookProxy):
    """
    Adds overloads for "special" auth methods.
    """
    def getSession(self):
        args = {}
        args['auth_token'] = self._client.auth_token
        args['method'] = "facebook.auth.getSession"
        res = self._client._do_request(True, args)
        self._client.session_key = str(res['session_key'])
        self._client.uid = str(res['uid'])
        try:
            self._client.secret = str(res['secret'])
        except:
            pass
        return res

    def createToken(self):
        res = self._client._do_request(True, {'method':"facebook.auth.createToken"})
        #print "res: " + str(res)
        self._client.auth_token = str(res['token'])
        return self._client.auth_token
        
*/

import flash.utils.Proxy;
import flash.utils.flash_proxy;

dynamic class FacebookProxy extends Proxy {
    private var _item:Array;

    public function FacebookProxy() {
        _item = new Array();
    }

    override flash_proxy function callProperty(methodName:*, ... args):* {
        var res:*;
        switch (methodName.toString()) {
            case 'clear':
            	// this would be a method called clear()
                break;
            default:
                res = _item[methodName].apply(_item, args);
                break;
        }
        return res;
    }

    override flash_proxy function getProperty(name:*):* {
        return _item[name];
    }

    override flash_proxy function setProperty(name:*, value:*):void {
        _item[name] = value;
    }
}