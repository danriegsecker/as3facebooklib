/*
	Copyright(c) 2007 Keith Salisbury, Winston Lee
	All rights reserved.
	
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
	import flexunit.framework.TestCase;
	import flexunit.framework.TestSuite;
	
	import com.facebook.Facebook;

	public class FacebookTest extends TestCase 
	{

		private const DOMAIN:String = "foo.macromedia.com";

		public function FacebookTest(methodName:String = null)
		{
			super(methodName);
		}

		public function testConstructor():void
		{
			var f:Facebook = new Facebook();
			assertNotNull(f.rest_url);
		}

		public function testSetKey():void
		{
			var f:Facebook = new Facebook();
			f.setKey("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
			assertEquals("f.api_key == \"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\"", f.api_key, "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
		}

	}
}