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
		public static var rest_url:String;

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
		public var userAgent:String;

		/**
		 * The session key.
		 * 
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public var sessionKey:String;

		/**
		 * The user id.
		 * 
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public var userId:String;

		/**
 		 * Creates a new Category object.
		 * 
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function Facebook()
		{
			rest_url = 'http://api.facebook.com/restserver.php';
			user_agent = 'ActionScript/3.0 Flash/8.5';
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
			Facebook.sessionKey = key;
			Facebook.userID = userId;
		}
	}
}
