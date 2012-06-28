package com.monday8am.ane
{
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	import flash.text.ReturnKeyLabel;
	
	public class CanonEOSLib extends EventDispatcher
	{
		
		public static const ExpCompValues			 : Array = [ { label: "+3" 	   , data: 0x18 },
																 { label: "+2 2/3" , data: 0x15 },
																 { label: "+2 1/2" , data: 0x14 },
																 { label: "+2 1/3" , data: 0x13 },
																 { label: "+2" 	   , data: 0x10 },
																 { label: "+1 2/3" , data: 0x0d },
																 { label: "+1 1/2" , data: 0x0c },
																 { label: "+1 1/3" , data: 0x0b },
																 { label: "+1" 	   , data: 0x08 },
																 { label: "+2/3"   , data: 0x05 },
																 { label: "+1/2"   , data: 0x04 },
																 { label: "+1/3"   , data: 0x03 },
																 { label: "0"      , data: 0x00 },
																 { label: "-1/3"   , data: 0xfd },
																 { label: "-1/2"   , data: 0xfc },
																 { label: "-1" 	   , data: 0xf8 },
																 { label: "-1 1/3" , data: 0xf5 },
																 { label: "-1 1/2" , data: 0xf4 },
																 { label: "-1 2/3" , data: 0xf3 },
																 { label: "-2" 	   , data: 0xf0 },
																 { label: "-2 1/3" , data: 0xed },
																 { label: "-2 1/2" , data: 0xec },
																 { label: "-2 2/3" , data: 0xeb },
																 { label: "-3" 	   , data: 0xe8 },
																 { label: "unknown", data: 0xffffffff }
																 ];
		

		
		
		public static const AvValues				 : Array = [ { label: "00" , data: 0x00 },
																 { label: "1"  , data: 0x08 },
																 { label: "1.1", data: 0x0B },
																 { label: "1.2", data: 0x0C },
																 { label: "1.2", data: 0x0D },
																 { label: "1.4", data: 0x10 },
																 { label: "1.6", data: 0x13 },
																 { label: "1.8", data: 0x14 },
																 { label: "1.8", data: 0x15 },
																 { label: "2"  , data: 0x18 },
																 { label: "2.2", data: 0x1B },
																 { label: "2.5", data: 0x1C },
																 { label: "2.5", data: 0x1D },
																 { label: "2.8", data: 0x20 },
																 { label: "3.2", data: 0x23 },
																 { label: "3.5", data: 0x24 },
																 { label: "3.5", data: 0x25 },
																 { label: "4"  , data: 0x28 },
																 { label: "4.5", data: 0x2B },
																 { label: "4.5", data: 0x2C },
																 { label: "5.0", data: 0x2D },
																 { label: "5.6", data: 0x30 },
																 { label: "6.3", data: 0x33 },
																 { label: "6.7", data: 0x34 },
																 { label: "7.1", data: 0x35 },
																 { label: "8"  , data: 0x38 },
																 { label: "9"  , data: 0x3B },
																 { label: "9.5", data: 0x3C },
																 { label: "10" , data: 0x3D },
																 { label: "11" , data: 0x40 },
																 { label: "13" , data: 0x43 },
																 { label: "13" , data: 0x44 },
																 { label: "14" , data: 0x45 },
																 { label: "16" , data: 0x48 },
																 { label: "18" , data: 0x4B },
																 { label: "19" , data: 0x4C },
																 { label: "20" , data: 0x4D },
																 { label: "22" , data: 0x50 },
																 { label: "25" , data: 0x53 },
																 { label: "27" , data: 0x54 },
																 { label: "29" , data: 0x55 },
																 { label: "32" , data: 0x58 },
																 { label: "36" , data: 0x5B },
																 { label: "38" , data: 0x5C },
																 { label: "40" , data: 0x5D },
																 { label: "45" , data: 0x60 },
																 { label: "51" , data: 0x63 },
																 { label: "54" , data: 0x64 },
																 { label: "57" , data: 0x65 },
																 { label: "64" , data: 0x68 },
																 { label: "72" , data: 0x6B },
																 { label: "76" , data: 0x6C },
																 { label: "80" , data: 0x6D },
																 { label: "91" , data: 0x70 },
																 { label: "unknown", data: 0xffffffff }	
																];
		
		
		public static const IsoValues				 : Array = [ { label: "Auto"   , data: 0x00 },
																 { label: "6"      , data: 0x28 },
																 { label: "12"     , data: 0x30 },
																 { label: "25"     , data: 0x38 },
																 { label: "50"     , data: 0x40 },
																 { label: "100"    , data: 0x48 },
																 { label: "125"    , data: 0x4b },
																 { label: "160"    , data: 0x4d },
																 { label: "200"    , data: 0x50 },
																 { label: "250"    , data: 0x53 },
																 { label: "320"    , data: 0x55 },
																 { label: "400"    , data: 0x58 },
																 { label: "500"    , data: 0x5b },
																 { label: "640"    , data: 0x5d },
																 { label: "800"    , data: 0x60 },
																 { label: "1000"   , data: 0x63 },
																 { label: "1250"   , data: 0x65 },
																 { label: "1600"   , data: 0x68 },
																 { label: "3200"   , data: 0x70 },
																 { label: "6400"   , data: 0x78 },
																 { label: "12800"  , data: 0x80 },
																 { label: "25600"  , data: 0x88 },
																 { label: "51200"  , data: 0x90 },
															 	 { label: "102400" , data: 0x98 },
																 { label: "unknown", data: 0xffffffff }];
		
		
		public static const AeModesValues			 : Array = [ { label: "Bulb", data: 0x0c },
																 { label: "30h" , data: 0x10 },
																 { label: "25h" , data: 0x13 },
																 { label: "20h" , data: 0x14 },
																 { label: "20h" , data: 0x15 },
																 { label: "15h" , data: 0x18 },
																 { label: "13h" , data: 0x1B },
																 { label: "10h" , data: 0x1C },
																 { label: "10h" , data: 0x1D },
																 { label: "8h"  , data: 0x20 },
																 { label: "6h"  , data: 0x23 },
																 { label: "6h"  , data: 0x24 },
																 { label: "5h"  , data: 0x25 },
																 { label: "4h"  , data: 0x28 },
																 { label: "3h2" , data: 0x2B },
																 { label: "3h"  , data: 0x2C },
																 { label: "2h5" , data: 0x2D },
																 { label: "2h"  , data: 0x30 },
																 { label: "1h6" , data: 0x33 },
																 { label: "1h5" , data: 0x34 },
																 { label: "1h3" , data: 0x35 },
																 { label: "1h"  , data: 0x38 },
																 { label: "0h8" , data: 0x3B },
																 { label: "0h7" , data: 0x3C },
																 { label: "0h6" , data: 0x3D },
																 { label: "0h5" , data: 0x40 },
																 { label: "0h4" , data: 0x43 },
																 { label: "0h3" , data: 0x44 },
																 { label: "0h3" , data: 0x45 },
																 { label: "4"   , data: 0x48 },
																 { label: "5"   , data: 0x4B },
																 { label: "6"   , data: 0x4C },
																 { label: "6"   , data: 0x4D },
																 { label: "8"   , data: 0x50 },
																 { label: "10"  , data: 0x53 },
																 { label: "10"  , data: 0x54 },
																 { label: "13"  , data: 0x55 },
																 { label: "15"  , data: 0x58 },
																 { label: "20"  , data: 0x5B },
																 { label: "20"  , data: 0x5C },
																 { label: "25"  , data: 0x5D },
																 { label: "30"  , data: 0x60 },
																 { label: "40"  , data: 0x63 },
																 { label: "45"  , data: 0x64 },
																 { label: "50"  , data: 0x65 },
																 { label: "60"  , data: 0x68 },
																 { label: "80"  , data: 0x6B },
																 { label: "90"  , data: 0x6C },
																 { label: "100" , data: 0x6D },
																 { label: "125" , data: 0x70 },
																 { label: "160" , data: 0x73 },
																 { label: "180" , data: 0x74 },
																 { label: "200" , data: 0x75 },
																 { label: "250" , data: 0x78 },
															     { label: "320" , data: 0x7B },
																 { label: "350" , data: 0x7C },
																 { label: "400" , data: 0x7D },
																 { label: "500" , data: 0x80 },
																 { label: "640" , data: 0x83 },
																 { label: "750" , data: 0x84 },
																 { label: "800" , data: 0x85 },
																 { label: "1000", data: 0x88 },
																 { label: "1250", data: 0x8B },
																 { label: "1500", data: 0x8C },
																 { label: "1600", data: 0x8D },
																 { label: "2000", data: 0x90 },
																 { label: "2500", data: 0x93 },
																 { label: "3000", data: 0x94 },
																 { label: "3200", data: 0x95 },
																 { label: "4000", data: 0x98 },
																 { label: "5000", data: 0x9B },
																 { label: "6000", data: 0x9C },
																 { label: "6400", data: 0x9D },
																 { label: "8000", data: 0xA0 },
																 { label: "unknown", data: 0xffffffff }
																 ];
		
		
		public static const TvValues				 : Array = [ { label: "P"			  , data: 0 },
																 { label: "Tv"			  , data: 1 },
																 { label: "Av"			  , data: 2 },
																 { label: "M"			  , data: 3 },
																 { label: "Bulb"		  , data: 4 },
																 { label: "A-DEP"		  , data: 5 },
																 { label: "DEP"			  , data: 6 },
																 { label: "C1"			  , data: 7 },
																 { label: "C2"			  , data: 16 },
																 { label: "C3"			  , data: 17 },
																 { label: "Lock"          , data: 8 },
																 { label: "GreenMode"	  , data: 9 },
																 { label: "Night Portrait", data: 10 },
																 { label: "Sports"		  , data: 11 },
																 { label: "LandScape"	  , data: 13 },
																 { label: "Close Up"	  , data: 14 },
																 { label: "No Strobo"	  , data: 15 },
																 { label: "Portrait"	  , data: 12 },
																 { label: "Creative Auto" , data: 19 },
																 { label: "unknown"		  , data: 0xffffffff }
																];

		private var _ExtensionContext : ExtensionContext;
		private var _camera : Camera; 
		private var _extensionContextReady : Boolean = true;
		public  var lastError : Error;
		
		
		public function CanonEOSLib()
		{
			try 
			{
				_ExtensionContext = ExtensionContext.createExtensionContext(  "com.monday8am.ane.CanonEOSLib" , null );
			}
			catch( e : Error ) 
			{
				lastError = e;
			}	
		}
		
		
		public function get extensionContextReady():Boolean
		{
			if( _ExtensionContext == null )
			{
				_extensionContextReady = false;
			}
			else
			{
				_extensionContextReady = true;
			}
			
			return _extensionContextReady;
		}

		
		public function getCamera():Camera
		{
			if( _camera == null )
			{
				_camera = new Camera( _ExtensionContext );
			}
			
			return _camera;
		}
		
		
		public function dispose():void 
		{ 
			if( _camera != null ) _camera.release();
			
			return _ExtensionContext.dispose(); 	
		}	
		
		
		public function isSupported():Boolean 
		{ 
			return _ExtensionContext.call( "isSupported" ); 
		}
		
		
	}
}