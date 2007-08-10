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
			// Not tested - need to have a valid api key to return successful result
			ts.addTest( Test( new FacebookServiceTest("testAuthCreateToken") ) );
			// Not tested - need to have a valid token to return successful result
			//ts.addTest( Test( new FacebookServiceAuthTest("testAuthGetSession") ) );

			//*********************************************************
			// Test the "Fbml" method group
			//*********************************************************
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testFbmlRefreshImgSrc") ) );
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testFbmlRefreshRefUrl") ) );
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testFbmlSetRefHandle") ) );

			//*********************************************************
			// Test the "Feed" method group
			//*********************************************************
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testFeedPublishStoryToUser") ) );
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testFeedPublishActionOfUser") ) );

			//*********************************************************
			// Test the "Fql" method group
			//*********************************************************
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testFqlQuery") ) );

			//*********************************************************
			// Test the "Friends" method group
			//*********************************************************
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testFriendsAreFriends") ) );
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testFriendsGet") ) );
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testFriendsGetAppUsers") ) );

			//*********************************************************
			// Test the "Notifications" method group
			//*********************************************************
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testNotificationsGet") ) );
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testNotificationsSend") ) );
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testNotificationsSendRequest") ) );

			//*********************************************************
			// Test the "Profile" method group
			//*********************************************************
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testProfileSetFBML") ) );
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testProfileGetFBML") ) );

			//*********************************************************
			// Test the "Users" method group
			//*********************************************************
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testUsersGetInfo") ) );
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testUsersGetLoggedInUser") ) );

			//*********************************************************
			// Test the "Events" method group
			//*********************************************************
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testEventsGet") ) );
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testEventsGetMembers") ) );

			//*********************************************************
			// Test the "Groups" method group
			//*********************************************************
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testGroupsGet") ) );
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testGroupsGetMembers") ) );

			//*********************************************************
			// Test the "Photos" method group
			//*********************************************************
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testPhotosAddTag") ) );
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testPhotosCreateAlbum") ) );
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testPhotosGet") ) );
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testPhotosGetAlbums") ) );
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testPhotosGetTags") ) );
			// Not tested - need to be authenticated to return successful result
			//ts.addTest( Test( new FacebookServiceTest("testPhotosUpload") ) );

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
		
		public function testAuthCreateToken():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.secret = SECRET;
			service.addEventListener( FacebookResultEvent.AUTH_CREATE_TOKEN, 
									  addAsync( onAuthCreateToken, CALL_TIMEOUT ) );
			service.auth.createToken();
		}
		
		private function onAuthCreateToken( event:FacebookResultEvent ):void {
			assertTrue("event.success == true", event.success );
			
			var token:String = String( event.data.token );
			assertTrue("event data is string with length", token.length > 0 );
		}

		//**************************************************************
		//
		// Tests for the "Fbml" Method Group
		//
		//**************************************************************
		
		public function testFbmlRefreshRefUrl():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.FBML_REFRESH_REF_URL, 
									  addAsync( onFbmlRefreshImgSrc, CALL_TIMEOUT ) );
			service.fbml.refreshRefUrl();
		}
		
		private function onFbmlRefreshRefUrl( event:FacebookResultEvent ):void {
		}

		public function testFbmlRefreshImgSrc():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.FBML_REFRESH_IMG_SRC, 
									  addAsync( onFbmlRefreshImgSrc, CALL_TIMEOUT ) );
			service.fbml.refreshImgSrc();
		}
		
		private function onFbmlRefreshImgSrc( event:FacebookResultEvent ):void {
		}

		//**************************************************************
		//
		// Tests for the "Feed" Method Group
		//
		//**************************************************************
		
		public function testFeedPublishStoryToUser():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.FEED_PUBLISH_STORY_TO_USER, 
									  addAsync( onFeedPublishStoryToUser, CALL_TIMEOUT ) );
			//service.feed.publishStoryToUser();
		}
		
		private function onFeedPublishStoryToUser( event:FacebookResultEvent ):void {
		}
		
		public function testFeedPublishActionOfUser():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.FEED_PUBLISH_STORY_TO_USER, 
									  addAsync( onFeedPublishActionOfUser, CALL_TIMEOUT ) );
			//service.feed.publishActionOfUser();
		}
		
		private function onFeedPublishActionOfUser( event:FacebookResultEvent ):void {
		}

		//**************************************************************
		//
		// Tests for the "Fql" Method Group
		//
		//**************************************************************
		
		public function testFqlQuery():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.FQL_QUERY, 
									  addAsync( onFqlQuery, CALL_TIMEOUT ) );
			//service.fql.query();
		}
		
		private function onFqlQuery( event:FacebookResultEvent ):void {
		}

		//**************************************************************
		//
		// Tests for the "Friends" Method Group
		//
		//**************************************************************
		
		public function testFriendsAreFriends():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.FRIENDS_ARE_FRIENDS, 
									  addAsync( onFriendsAreFriends, CALL_TIMEOUT ) );
			//service.friends.areFriends();
		}
		
		private function onFriendsAreFriends( event:FacebookResultEvent ):void {
		}
		
		public function testFriendsGet():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.FRIENDS_GET, 
									  addAsync( onFriendsGet, CALL_TIMEOUT ) );
			service.friends.get();
		}
		
		private function onFriendsGet( event:FacebookResultEvent ):void {
			var friends:Array = event.data;
			
			assertTrue( "friends length > 0", friends.length > 0 );
			assertTrue( "friends[0] uid1 populated", friends[0].uid1.length > 0 );
			assertTrue( "friends[0] uid2 populated", friends[0].uid1.length > 0 );
		}

		public function testFriendsGetAppUsers():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.FRIENDS_GET_APP_USERS, 
									  addAsync( onFriendsGetAppUsers, CALL_TIMEOUT ) );
			//service.friends.getAppUsers();
		}
		
		private function onFriendsGetAppUsers( event:FacebookResultEvent ):void {
			
			
		}

		//**************************************************************
		//
		// Tests for the "Notifications" Method Group
		//
		//**************************************************************
		
		public function testNotificationsGet():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.NOTIFICATIONS_GET, 
									  addAsync( onNotificationsGet, CALL_TIMEOUT ) );
			//service.notifications.get();
		}
		
		private function onNotificationsGet( event:FacebookResultEvent ):void {
		}
		
		public function testNotificationsSend():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.NOTIFICATIONS_SEND, 
									  addAsync( onNotificationsSend, CALL_TIMEOUT ) );
			//service.notifications.send();
		}
		
		private function onNotificationsSend( event:FacebookResultEvent ):void {
		}
		
		public function testNotificationsSendRequest():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.NOTIFICATIONS_SEND_REQUEST, 
									  addAsync( onNotificationsSendRequest, CALL_TIMEOUT ) );
			//service.notifications.sendRequest();
		}
		
		private function onNotificationsSendRequest( event:FacebookResultEvent ):void {
		}

		//**************************************************************
		//
		// Tests for the "Users" Method Group
		//
		//**************************************************************
		
		public function testUsersGetInfo():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.USERS_GET_INFO, 
									  addAsync( onUsersGetInfo, CALL_TIMEOUT ) );
			//service.users.getInfo();
		}
		
		private function onUsersGetInfo( event:FacebookResultEvent ):void {
		}
		
		public function testUsersGetLoggedInUser():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.USERS_GET_INFO, 
									  addAsync( onUsersGetLoggedInUser, CALL_TIMEOUT ) );
			//service.users.getLoggedInUser();
		}
		
		private function onUsersGetLoggedInUser( event:FacebookResultEvent ):void {
		}

		//**************************************************************
		//
		// Tests for the "Events" Method Group
		//
		//**************************************************************
		
		public function testEventsGet():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.EVENTS_GET, 
									  addAsync( onUsersGetInfo, CALL_TIMEOUT ) );
			//service.events.get();
		}
		
		private function onEventsGet( event:FacebookResultEvent ):void {
		}
		
		public function testEventsGetMembers():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.EVENTS_GET_MEMBERS, 
									  addAsync( onEventsGetMembers, CALL_TIMEOUT ) );
			//service.events.getMembers();
		}
		
		private function onEventsGetMembers( event:FacebookResultEvent ):void {
		}

		//**************************************************************
		//
		// Tests for the "Groups" Method Group
		//
		//**************************************************************
		
		public function testGroupsGet():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.GROUPS_GET, 
									  addAsync( onGroupsGet, CALL_TIMEOUT ) );
			//service.groups.get();
		}
		
		private function onGroupsGet( event:FacebookResultEvent ):void {
		}
		
		public function testGroupsGetMembers():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.GROUPS_GET_MEMBERS, 
									  addAsync( onGroupsGetMembers, CALL_TIMEOUT ) );
			//service.groups.getMembers();
		}
		
		private function onGroupsGetMembers( event:FacebookResultEvent ):void {
		}

		//**************************************************************
		//
		// Tests for the "Photos" Method Group
		//
		//**************************************************************
		
		public function testPhotosAddTag():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.PHOTOS_ADD_TAG, 
									  addAsync( onPhotosAddTag, CALL_TIMEOUT ) );
			//service.photos.addTag();
		}

		private function onPhotosAddTag( event:FacebookResultEvent ):void {
		}
		
		public function testPhotosCreateAlbum():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.PHOTOS_CREATE_ALBUM, 
									  addAsync( onPhotosCreateAlbum, CALL_TIMEOUT ) );
			//service.photos.createAlbum();
		}

		private function onPhotosCreateAlbum( event:FacebookResultEvent ):void {
		}
		
		public function testPhotosGet():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.PHOTOS_GET, 
									  addAsync( onPhotosGet, CALL_TIMEOUT ) );
			//service.photos.get();
		}

		private function onPhotosGet( event:FacebookResultEvent ):void {
		}
		
		public function testPhotosGetAlbums():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.PHOTOS_GET_ALBUMS, 
									  addAsync( onPhotosGetAlbums, CALL_TIMEOUT ) );
			//service.photos.getAlbums();
		}

		private function onPhotosGetAlbums( event:FacebookResultEvent ):void {
		}
		
		public function testPhotosGetTags():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.PHOTOS_GET_TAGS, 
									  addAsync( onPhotosGetTags, CALL_TIMEOUT ) );
			//service.photos.getTags();
		}

		private function onPhotosGetTags( event:FacebookResultEvent ):void {
		}
		
		public function testPhotosUpload():void {
			var service:FacebookService = new FacebookService( API_KEY );
			service.addEventListener( FacebookResultEvent.PHOTOS_UPLOAD, 
									  addAsync( onPhotosUpload, CALL_TIMEOUT ) );
			//service.photos.upload();
		}

		private function onPhotosUpload( event:FacebookResultEvent ):void {
		}

	}

}