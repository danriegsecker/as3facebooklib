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
	
	/**
	 * Hours is a ValueObject for the Facebook API.
	 */
	public class Hours {
		
		private var _mon_1_open:Date;
		private var _mon_1_close:Date;
		private var _tue_1_open:Date;
		private var _tue_1_close:Date;
		private var _wed_1_open:Date;
		private var _wed_1_close:Date;
		private var _thu_1_open:Date;
		private var _thu_1_close:Date;
		private var _fri_1_open:Date;
		private var _fri_1_close:Date;
		private var _sat_1_open:Date;
		private var _sat_1_close:Date;
		private var _sun_1_open:Date;
		private var _sun_1_close:Date;
		private var _mon_2_open:Date;
		private var _mon_2_close:Date;
		private var _tue_2_open:Date;
		private var _tue_2_close:Date;
		private var _wed_2_open:Date;
		private var _wed_2_close:Date;
		private var _thu_2_open:Date;
		private var _thu_2_close:Date;
		private var _fri_2_open:Date;
		private var _fri_2_close:Date;
		private var _sat_2_open:Date;
		private var _sat_2_close:Date;
		private var _sun_2_open:Date;
		private var _sun_2_close:Date;

		/**
		 * Construct a new Hours instance
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function Hours() {
		}	

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get mon_1_open():Date {
			return _mon_1_open;
		}
		
		public function set mon_1_open( value:Date ):void {
			_mon_1_open = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get mon_1_close():Date {
			return _mon_1_close;
		}
		
		public function set mon_1_close( value:Date ):void {
			_mon_1_close = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get tue_1_open():Date {
			return _tue_1_open;
		}
		
		public function set tue_1_open( value:Date ):void {
			_tue_1_open = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get tue_1_close():Date {
			return _tue_1_close;
		}
		
		public function set tue_1_close( value:Date ):void {
			_tue_1_close = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get wed_1_open():Date {
			return _wed_1_open;
		}
		
		public function set wed_1_open( value:Date ):void {
			_wed_1_open = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get wed_1_close():Date {
			return _wed_1_close;
		}
		
		public function set wed_1_close( value:Date ):void {
			_wed_1_close = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get thu_1_open():Date {
			return _thu_1_open;
		}
		
		public function set thu_1_open( value:Date ):void {
			_thu_1_open = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get thu_1_close():Date {
			return _thu_1_close;
		}
		
		public function set thu_1_close( value:Date ):void {
			_thu_1_close = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get fri_1_open():Date {
			return _fri_1_open;
		}
		
		public function set fri_1_open( value:Date ):void {
			_fri_1_open = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get fri_1_close():Date {
			return _fri_1_close;
		}
		
		public function set fri_1_close( value:Date ):void {
			_fri_1_close = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get sat_1_open():Date {
			return _sat_1_open;
		}
		
		public function set sat_1_open( value:Date ):void {
			_sat_1_open = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get sat_1_close():Date {
			return _sat_1_close;
		}
		
		public function set sat_1_close( value:Date ):void {
			_sat_1_close = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get sun_1_open():Date {
			return _sun_1_open;
		}
		
		public function set sun_1_open( value:Date ):void {
			_sun_1_open = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get sun_1_close():Date {
			return _sun_1_close;
		}
		
		public function set sun_1_close( value:Date ):void {
			_sun_1_close = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get mon_2_open():Date {
			return _mon_2_open;
		}
		
		public function set mon_2_open( value:Date ):void {
			_mon_2_open = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get mon_2_close():Date {
			return _mon_2_close;
		}
		
		public function set mon_2_close( value:Date ):void {
			_mon_2_close = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get tue_2_open():Date {
			return _tue_2_open;
		}
		
		public function set tue_2_open( value:Date ):void {
			_tue_2_open = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get tue_2_close():Date {
			return _tue_2_close;
		}
		
		public function set tue_2_close( value:Date ):void {
			_tue_2_close = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get wed_2_open():Date {
			return _wed_2_open;
		}
		
		public function set wed_2_open( value:Date ):void {
			_wed_2_open = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get wed_2_close():Date {
			return _wed_2_close;
		}
		
		public function set wed_2_close( value:Date ):void {
			_wed_2_close = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get thu_2_open():Date {
			return _thu_2_open;
		}
		
		public function set thu_2_open( value:Date ):void {
			_thu_2_open = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get thu_2_close():Date {
			return _thu_2_close;
		}
		
		public function set thu_2_close( value:Date ):void {
			_thu_2_close = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get fri_2_open():Date {
			return _fri_2_open;
		}
		
		public function set fri_2_open( value:Date ):void {
			_fri_2_open = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get fri_2_close():Date {
			return _fri_2_close;
		}
		
		public function set fri_2_close( value:Date ):void {
			_fri_2_close = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get sat_2_open():Date {
			return _sat_2_open;
		}
		
		public function set sat_2_open( value:Date ):void {
			_sat_2_open = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get sat_2_close():Date {
			return _sat_2_close;
		}
		
		public function set sat_2_close( value:Date ):void {
			_sat_2_close = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get sun_2_open():Date {
			return _sun_2_open;
		}
		
		public function set sun_2_open( value:Date ):void {
			_sun_2_open = value;
		}

		/**
		 * Each field is returned with time (in seconds since epoch). For example, 9.00AM is represented as 406800.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get sun_2_close():Date {
			return _sun_2_close;
		}
		
		public function set sun_2_close( value:Date ):void {
			_sun_2_close = value;
		}

	}
	
}