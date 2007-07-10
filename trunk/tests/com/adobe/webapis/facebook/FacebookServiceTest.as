/*
Adobe Systems Incorporated(r) Source Code License Agreement
Copyright(c) 2005 Adobe Systems Incorporated. All rights reserved.
	
Please read this Source Code License Agreement carefully before using
the source code.
	
Adobe Systems Incorporated grants to you a perpetual, worldwide, non-exclusive,
no-charge, royalty-free, irrevocable copyright license, to reproduce,
prepare derivative works of, publicly display, publicly perform, and
distribute this source code and such derivative works in source or
object code form without any attribution requirements.
	
The name "Adobe Systems Incorporated" must not be used to endorse or promote products
derived from the source code without prior written permission.
	
You agree to indemnify, hold harmless and defend Adobe Systems Incorporated from and
against any loss, damage, claims or lawsuits, including attorney's
fees that arise or result from your use or distribution of the source
code.
	
THIS SOURCE CODE IS PROVIDED "AS IS" AND "WITH ALL FAULTS", WITHOUT
ANY TECHNICAL SUPPORT OR ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING,
BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
FOR A PARTICULAR PURPOSE ARE DISCLAIMED. ALSO, THERE IS NO WARRANTY OF
NON-INFRINGEMENT, TITLE OR QUIET ENJOYMENT. IN NO EVENT SHALL MACROMEDIA
OR ITS SUPPLIERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOURCE CODE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

package com.adobe.webapis.facebook {

	import flexunit.framework.TestCase;
	import flexunit.framework.TestSuite;
	
	import com.adobe.webapis.facebook.*;
	import com.adobe.webapis.facebook.events.*;
	import com.adobe.webapis.facebook.methodgroups.MethodGroupHelper;
	import flexunit.framework.Test;
	
	public class FacebookServiceTest extends TestCase {
		
		private const CALL_TIMEOUT:int = 10000;
		
		/**
		*	You need to provide your own API keys here in order for the
		*	test to run.
		*
		*	http://developers.facebook.com/documentation.php?v=1.0&doc=auth
		*/		
		public static var API_KEY:String = "<APP KEY>";
		public static var SECRET:String = "<SHARED SECRET>";
		
	    public function FacebookServiceTest( methodName:String ) {
			super( methodName );
        }
	
		public static function suite():TestSuite {
			var ts:TestSuite = new TestSuite();
			
			ts.addTest( Test( new FacebookServiceTest("testAPIKey") ) );
			ts.addTest( Test( new FacebookServiceTest("testSecret") ) );
			
			//*********************************************************
			// Test the "Auth" method group
			//*********************************************************
			// Not tested - need to have a valid token to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testAuthCheckToken") ) );
			ts.addTest( Test( new FacebookServiceTest("testAuthGetFrob") ) );
			// Not tested - need to have a valid frob to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testAuthGetToken") ) );
			
			return ts;
		}
		
		public function testAPIKey():void {
			var service:FacebookService = new FacebookService( API_KEY );
		
			assertTrue( "service.api_key == API_KEY", service.api_key == API_KEY );
		}
		
		public function testSecret():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.secret = SECRET;
			assertTrue( "service.secret == SECRET", service.secret == SECRET );
		}
		
		//**************************************************************
		//
		// Tests for the "Auth" Method Group
		//
		//**************************************************************
		
		public function testAuthGetFrob():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.secret = SECRET;
			service.addEventListener( FacebookResultEvent.AUTH_GET_FROB, 
									  addAsync( onAuthGetFrob, CALL_TIMEOUT ) );
			service.auth.getFrob();
		}
		
		private function onAuthGetFrob( event:FacebookResultEvent ):void {
			assertTrue("event.success == true", event.success );
			
			var frob:String = String( event.data.frob );
			assertTrue("event data is string with length", frob.length > 0 ); 
		}
		
		//**************************************************************
		//
		// Tests for the "Test" Method Group
		//
		//**************************************************************
		
		public function testTestEcho():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.TEST_ECHO, 
									  addAsync( onTestEcho, CALL_TIMEOUT ) );
			service.test.echo( "test" );
		}
	
		private function onTestEcho( event:FacebookResultEvent ):void {
			assertTrue("event.success == true", event.success );
			assertTrue("event.data.method == 'facebook.test.echo'", event.data.method = "facebook.test.echo");
			assertTrue("event.data.param0 == 'test'", event.data.param0 == "test");
		}
		
		public function testTestLogin():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.TEST_LOGIN, 
									  addAsync( onTestLogin, CALL_TIMEOUT ) );
			service.test.login();
		}
		
		private function onTestLogin( event:FacebookResultEvent ):void {
			// Because we're not logged in, we should get an insufficient permission
			assertTrue("event.success == false", event.success == false );
			
			// Test the the error was constructed correctly
			var e:FlickrError = event.data.error;
			assertTrue( "e.errorCode == insufficient permission", e.errorCode == FlickrError.INSUFFICIENT_PERMISSIONS );
			assertTrue( "testing for correct error message", e.errorMessage == "Insufficient permissions. Method requires read privileges; none granted." );
			
		}
	}

}