package asiads;

import flash.events.Event;
import flash.events.EventDispatcher;
import openfl.Lib;

class AsiAds
{
	public static var dispatch:EventDispatcher=null;

	public static function Init():Void
	{
		trace("AsiAds : Init");

		if(AsiAds.dispatch==null)
		{
			AsiAds.dispatch = new EventDispatcher();
			asiads_init(asiadsevent_callback);
		}
	}	

	public static function asiadsevent_callback(eventId:Int):Void
	{
		trace("AsiAds : asiadsevent_callback: received event: "+eventId+": event: "+AsiAdsEvent.ACTION_START);

		/*
		#define kAsiAdsEventBannerViewActionBegin 0
		#define kAsiAdsEventBannerActionDidFinish 1
		#define kAsiAdsEventBannerFailedToLoad 2
		#define kAsiAdsEventBannerDidLoad 3
		*/

		switch(eventId)
		{
			case 0:
				trace("AsiAds : dispatchEvent: AsiAdsEvent.ACTION_START");

				//Pause everything
				Lib.pause();
				AsiAds.dispatch.dispatchEvent(new AsiAdsEvent(AsiAdsEvent.ACTION_START));

			case 1:
				trace("AsiAds : dispatchEvent: AsiAdsEvent.ACTION_END");
				Lib.resume();
				AsiAds.dispatch.dispatchEvent(new AsiAdsEvent(AsiAdsEvent.ACTION_END));

			case 2:
				trace("AsiAds : dispatchEvent: AsiAdsEvent.LOAD_ERROR");
				AsiAds.dispatch.dispatchEvent(new AsiAdsEvent(AsiAdsEvent.LOAD_ERROR));

			case 3:
				//This is how we make money
				trace("AsiAds : dispatchEvent: AsiAdsEvent.LOAD_COMPLETE");
				AsiAds.dispatch.dispatchEvent(new AsiAdsEvent(AsiAdsEvent.LOAD_COMPLETE));
		}

	}

	public static function ShowAd()
	{
		asiads_showad();
	}

	public static function HideAd()
	{
		asiads_hidead();
	}

	public static function RemoveAd()
	{
		asiads_removead();
	}

	static var asiads_init= nme.Loader.load("asiads_init",1);
	static var asiads_showad = nme.Loader.load("asiads_showad",0);
	static var asiads_hidead = nme.Loader.load("asiads_hidead",0);
	static var asiads_removead = nme.Loader.load("asiads_removead",0);
}

class AsiAdsEvent extends Event
{
	public static inline var ACTION_START:String = 'ACTION_START';
	public static inline var ACTION_END:String = 'ACTION_END';
	public static inline var LOAD_ERROR:String = 'LOAD_ERROR';
	public static inline var LOAD_COMPLETE:String = 'LOAD_COMPLETE';


	public function new(evt:String)
	{
			super(evt);
	}
}