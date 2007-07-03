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

package com.facebook
{
	/**
	 * Base facebook class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 8.5
	 * @tiptext
	 * 
	 * @see http://developers.facebook.com/documentation.php
	 */	
	public class Facebook
	{
		/**
		 * The url for the facebook rest api.
		 * 
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public var rest_url:String;

		/**
		 * The api authentication key.
		 * 
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public var api_key:String;

		/**
		 * The api authentication key.
		 * 
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public var secret:String;

		/**
		 * The user agent.
		 * 
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public var user_agent:String;

		/**
		 * The session key.
		 * 
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public var session_key:String;

		/**
		 * The user id.
		 * 
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public var user_id:String;

		/**
 		 * Creates a new Category object.
		 * 
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function Facebook(api_key:String, secret_key:String)
		{
		    //facebookURL = "http://api.facebook.com/restserver.php"
		    //facebookSecureURL = "https://api.facebook.com/restserver.php"

			rest_url = 'http://api.facebook.com/restserver.php';
			user_agent = 'ActionScript/3.0 Flash/8.5';
			
	        //this.api_key = api_key
	        //this.secret_key = secret_key
	        //this.secret = secret_key
	        //this.session_key = None
	        //this.auth = new AuthFacebookProxy("facebook.auth")
	
		}

		/**
		 * Returns an MD5 hash of arguments.
		 * 
		 * @param args A object that represents the arguments.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function hashArgs(args:Object):void
		{
	        //hasher = md5.new(''.join([x + '=' + args[x] for x in sorted(args.keys())]))
	        //hasher.update(self.secret)
	        //return hasher.hexdigest()
		}

		/**
		 * Returns the authentication url.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function getAuthURL():String
		{
        	return "http://api.facebook.com/login.php?api_key=" + this.api_key + "&auth_token=" + this.auth_token
		}

		/**
		 * Sets the authentication token.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function setAuthToken():void
		{
	        this.auth_token = token
		}

		/**
		 * Do request.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function doRequest(secure:Boolean, args:Object):void
		{
			/*
	        for arg in args.items():
	            if type(arg[1]) == list:
	                args[arg[0]] = ','.join(arg[1])
	        args['api_key'] = self.api_key
	        args['sig'] = self.__hash_args(args)
	        post_data = urllib.urlencode(args)
	        if secure:
	            url = self.FacebookSecureURL + "?" + post_data
	        else:
	            url = self.FacebookURL + "?" + post_data
	        try:
	            rsp = xmltramp.load(url)
	        except:
	            raise RuntimeError("Failed to download and parse XML result.")
	        self._check_error(rsp)
	        return rsp
	        */
		}

		/**
		 * Check error.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function checkError(res:Object):void
		{
			/*
		    def _check_error(self, res):
		        code = ""
		        msg = ""
		        try:
		            code = str(res['fb_error']['code'])
		            msg = str(res['fb_error']['msg'])
		        except:
		            return
		        raise FacebookError(code, msg)
	        */
		}

		/**
		 * Assigns the api key.
		 * 
		 * @param key A string that represents the key.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function setKey(key:String):void
		{
			api_key = key;
		}

		/**
		 * Starts a new session with the credentials supplied
		 * 
		 * @param userId A string that represents the user id.
		 * @param sessionKey A string that represents the session key, obtained from "facebook.auth.getSession".
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function startSession(userId:String,key:String):void
		{
			session_key = key;
			user_id = userId;
		}
	}
}
