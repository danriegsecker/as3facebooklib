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
	 * Page is a ValueObject for the Facebook API.
	 */
	public class Page {
		
		private var _page_id:int;
		private var _name:String;
		private var _pic_small:String;
		private var _pic_square:String;
		private var _pic_big:String;
		private var _pic:String;
		private var _pic_large:String;
		private var _type:String;
		private var _website:String;
		private var _has_added_app:Boolean;
		private var _founded:String;
		private var _company_overview:String;
		private var _mission:String;
		private var _products:String;
		private var _location:Location;
		private var _parking:Parking;
		private var _public_transit:String;
		private var _hours:Hours;
		private var _attire:String;
		private var _payment_options:PaymentOptions;
		private var _culinary_team:String;
		private var _general_manager:String;
		private var _price_range:String;
		private var _restaurant_services:RestaurantServices;
		private var _restaurant_specialties:RestaurantSpecialties;
		private var _release_date:Date;
		private var _genre:String;
		private var _starring:String;
		private var _screenplay_by:String;
		private var _directed_by:String;
		private var _produced_by:String;
		private var _studio:String;
		private var _awards:String;
		private var _plot_outline:String;
		private var _network:String;
		private var _season:String;
		private var _schedule:String;
		private var _written_by:String;
		private var _band_members:String;
		private var _hometown:String;
		private var _current_location:Location;
		private var _record_label:String;
		private var _booking_agent:String;
		private var _artists_we_like:String;
		private var _influences:String;
		private var _band_interests:String;
		private var _bio:String;
		private var _affilation:String;
		private var _birthday:String;
		private var _personal_info:String;
		private var _personal_interests:String;
		private var _members:String;
		private var _built:String;
		private var _features:String;
		private var _mpg:String;
		private var _general_info:String;

		/**
		 * Construct a new Page instance
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function Page() {
		}	
		
		/**
		 * The id corresponding to the page returned. 
		 * This is always returned (whether included in fields or not, and always as the first subelement.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get page_id():int {
			return _page_id;
		}
		
		public function set page_id( value:int ):void {
			_page_id = value;
		}
		
		/**
		 * Page entered profile field. May not be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get name():String {
			return _name;
		}
		
		public function set name( value:String ):void {
			_name = value;
		}
		
		/**
		 * URL of profile picture, with max width 50px and max height 150px. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get pic_small():String {
			return _pic_small;
		}
		
		public function set pic_small( value:String ):void {
			_pic_small = value;
		}
		
		/**
		 * URL of a square section of the profile picture, with width 50px and height 50px. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get pic_square():String {
			return _pic_square;
		}
		
		public function set pic_square( value:String ):void {
			_pic_square = value;
		}
		
		/**
		 * URL of profile picture with max width 200px and max height 600px. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get pic_big():String {
			return _pic_big;
		}
		
		public function set pic_big( value:String ):void {
			_pic_big = value;
		}
		
		/**
		 * URL of profile picture with max width 100px and max height 300px. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get pic():String {
			return _pic;
		}
		
		public function set pic( value:String ):void {
			_pic = value;
		}
		
		/**
		 * URL of profile picture with max width 396px and max height 1188px. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get pic_large():String {
			return _pic_large;
		}
		
		public function set pic_large( value:String ):void {
			_pic_large = value;
		}
		
		/**
		 * The type of page.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get type():String {
			return _type;
		}
		
		public function set type( value:String ):void {
			_type = value;
		}
		
		/**
		 * Website of Page. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get website():String {
			return _website;
		}
		
		public function set website( value:String ):void {
			_website = value;
		}
		
		/**
		 * Boolean indicating whether the page has added the calling application
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get has_added_app():Boolean {
			return _has_added_app;
		}
		
		public function set has_added_app( value:Boolean ):void {
			_has_added_app = value;
		}
		
		/**
		 * When company was founded. May be blank
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get founded():String {
			return _founded;
		}
		
		public function set founded( value:String ):void {
			_founded = value;
		}
		
		/**
		 * Company overiew. May be blank
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get company_overview():String {
			return _company_overview;
		}
		
		public function set company_overview( value:String ):void {
			_company_overview = value;
		}

		/**
		 * Mission of company. May be blank
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get mission():String {
			return _mission;
		}
		
		public function set mission( value:String ):void {
			_mission = value;
		}

		/**
		 * Company's products. May be blank
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get products():String {
			return _products;
		}
		
		public function set products( value:String ):void {
			_products = value;
		}

		/**
		 * Contains the location of the entity. Applies to Local Businesses.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get location():Location {
			return _location;
		}
		
		public function set location( value:Location ):void {
			_location = value;
		}

		/**
		 * Parking options available. Contains three children: street, lot, and valet. 
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get parking():Parking {
			return _parking;
		}
		
		public function set parking( value:Parking ):void {
			_parking = value;
		}

		/**
		 * Public transit details, e.g. Take Caltrain to Palo Alto station. Walk down Universty one block. 
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get public_transit():String {
			return _public_transit;
		}
		
		public function set public_transit( value:String ):void {
			_public_transit = value;
		}

		/**
		 * Contains the operating hours. Each local business will be allowed to specify up to two sets of operating hours per day. 
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get hours():Hours {
			return _hours;
		}
		
		public function set hours( value:Hours ):void {
			_hours = value;
		}

		/**
		 * Restaurant recommended attire, may be one of Unspecfied, Casual, or Dressy.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get attire():String {
			return _attire;
		}
		
		public function set attire( value:String ):void {
			_attire = value;
		}

		/**
		 * Payment options accepted. Contains five children:  cash_only, visa, amex, master_card, and discover.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get payment_options():PaymentOptions {
			return _payment_options;
		}
		
		public function set payment_options( value:PaymentOptions ):void {
			_payment_options = value;
		}

		/**
		 * Culinary team. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get culinary_team():String {
			return _culinary_team;
		}
		
		public function set culinary_team( value:String ):void {
			_culinary_team = value;
		}

		/**
		 * General manager. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get general_manager():String {
			return _general_manager;
		}
		
		public function set general_manager( value:String ):void {
			_general_manager = value;
		}

		/**
		 * Price range, one of the following strings: "Unspecified", "$ (0-10)", "$$ (10-30)", "$$$ (30-50)", "$$$ (50+)".
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get price_range():String {
			return _price_range;
		}
		
		public function set price_range( value:String ):void {
			_price_range = value;
		}

		/**
		 * Other services offered by a restaurant. Contains the following children: reserve, walkins, groups, kids, takeout, delivery, catering, waiter, and outdoor. 
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get restaurant_services():RestaurantServices {
			return _restaurant_services;
		}
		
		public function set restaurant_services( value:RestaurantServices ):void {
			_restaurant_services = value;
		}

		/**
		 * Restaurant specialties. Contains the following children: breakfast, lunch, dinner, coffee, and drinks. 
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get restaurant_specialties():RestaurantSpecialties {
			return _restaurant_specialties;
		}
		
		public function set restaurant_specialties( value:RestaurantSpecialties ):void {
			_restaurant_specialties = value;
		}

		/**
		 * Release date of film. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get release_date():Date {
			return _release_date;
		}
		
		public function set release_date( value:Date ):void {
			_release_date = value;
		}

		/**
		 * Free form text field, genre of music, tv or film. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get genre():String {
			return _genre;
		}
		
		public function set genre( value:String ):void {
			_genre = value;
		}

		/**
		 * Who's starring in TV/Film. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get starring():String {
			return _starring;
		}
		
		public function set starring( value:String ):void {
			_starring = value;
		}

		/**
		 * Screenplay of Film by. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get screenplay_by():String {
			return _screenplay_by;
		}
		
		public function set screenplay_by( value:String ):void {
			_screenplay_by = value;
		}

		/**
		 * Who directed TV/Film. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get directed_by():String {
			return _directed_by;
		}
		
		public function set directed_by( value:String ):void {
			_directed_by = value;
		}

		/**
		 * Who produced TV/Film. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get produced_by():String {
			return _produced_by;
		}
		
		public function set produced_by( value:String ):void {
			_produced_by = value;
		}

		/**
		 * Studio Film was produced. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get studio():String {
			return _studio;
		}
		
		public function set studio( value:String ):void {
			_studio = value;
		}

		/**
		 * Awards received by TV/Film. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get awards():String {
			return _awards;
		}
		
		public function set awards( value:String ):void {
			_awards = value;
		}

		/**
		 * Plot outline of TV/Film. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get plot_outline():String {
			return _plot_outline;
		}
		
		public function set plot_outline( value:String ):void {
			_plot_outline = value;
		}

		/**
		 * Network of TV show. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get network():String {
			return _network;
		}
		
		public function set network( value:String ):void {
			_network = value;
		}

		/**
		 * Season of TV show. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get season():String {
			return _season;
		}
		
		public function set season( value:String ):void {
			_season = value;
		}

		/**
		 * Schedule of TV show. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get schedule():String {
			return _schedule;
		}
		
		public function set schedule( value:String ):void {
			_schedule = value;
		}

		/**
		 * Who wrote TV/Film. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get written_by():String {
			return _written_by;
		}
		
		public function set written_by( value:String ):void {
			_written_by = value;
		}

		/**
		 * Members of the band. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get band_members():String {
			return _band_members;
		}
		
		public function set band_members( value:String ):void {
			_band_members = value;
		}

		/**
		 * Hometown field. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get hometown():String {
			return _hometown;
		}
		
		public function set hometown( value:String ):void {
			_hometown = value;
		}

		/**
		 * Current location. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get current_location():Location {
			return _current_location;
		}
		
		public function set current_location( value:Location ):void {
			_current_location = value;
		}

		/**
		 * Record label. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get record_label():String {
			return _record_label;
		}
		
		public function set record_label( value:String ):void {
			_record_label = value;
		}

		/**
		 * Booking agent. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get booking_agent():String {
			return _booking_agent;
		}
		
		public function set booking_agent( value:String ):void {
			_booking_agent = value;
		}

		/**
		 * Artists also liked by the musician. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get artists_we_like():String {
			return _artists_we_like;
		}
		
		public function set artists_we_like( value:String ):void {
			_artists_we_like = value;
		}

		/**
		 * Influences. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get influences():String {
			return _influences;
		}
		
		public function set influences( value:String ):void {
			_influences = value;
		}

		/**
		 * Band interests. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get band_interests():String {
			return _band_interests;
		}
		
		public function set band_interests( value:String ):void {
			_band_interests = value;
		}

		/**
		 * Biography field. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get bio():String {
			return _bio;
		}
		
		public function set bio( value:String ):void {
			_bio = value;
		}

		/**
		 * Affiliation field of person or team. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get affilation():String {
			return _affilation;
		}
		
		public function set affilation( value:String ):void {
			_affilation = value;
		}

		/**
		 * Birthday field. May be blank. In the format mm/dd/yyyy
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get birthday():String {
			return _birthday;
		}
		
		public function set birthday( value:String ):void {
			_birthday = value;
		}

		/**
		 * Personal information of public figure. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get personal_info():String {
			return _personal_info;
		}
		
		public function set personal_info( value:String ):void {
			_personal_info = value;
		}

		/**
		 * Personal interests of public figure. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get personal_interests():String {
			return _personal_interests;
		}
		
		public function set personal_interests( value:String ):void {
			_personal_interests = value;
		}

		/**
		 * Members of team. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get members():String {
			return _members;
		}
		
		public function set members( value:String ):void {
			_members = value;
		}

		/**
		 * When automobile was built. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get built():String {
			return _built;
		}
		
		public function set built( value:String ):void {
			_built = value;
		}

		/**
		 * Features of automotive. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get features():String {
			return _features;
		}
		
		public function set features( value:String ):void {
			_features = value;
		}

		/**
		 * Mpg of automotive. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get mpg():String {
			return _mpg;
		}
		
		public function set mpg( value:String ):void {
			_mpg = value;
		}

		/**
		 * General info field. May be blank.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get general_info():String {
			return _general_info;
		}
		
		public function set general_info( value:String ):void {
			_general_info = value;
		}

	}

}