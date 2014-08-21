#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#include "asiAds.h"

//Event ids
#define kAsiAdsEventBannerViewActionBegin 0
#define kAsiAdsEventBannerActionDidFinish 1
#define kAsiAdsEventBannerFailedToLoad 2
#define kAsiAdsEventBannerDidLoad 3

extern "C" void dispatchEvent(int eventId);

@interface iAdsDelegate:NSObject <ADBannerViewDelegate>

@end

@implementation iAdsDelegate

-(id) init
{
	NSLog(@"AsiAds : iAdsDelegate :: init");
	self = [super init];
	return self;
}

#pragma mark iAds delegate methods

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    NSLog(@"AsiAds : iAdsDelegate :: bannerViewDidLoadAd");
    dispatchEvent(kAsiAdsEventBannerDidLoad);
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    NSLog(@"AsiAds : iAdsDelegate :: didFailToReceiveAdWithError - %@",error);
    dispatchEvent(kAsiAdsEventBannerFailedToLoad);
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    NSLog(@"AsiAds : iAdsDelegate :: bannerViewActionShouldBegin - willLeaveApplication: %i",willLeave);
    dispatchEvent(kAsiAdsEventBannerViewActionBegin);
    return YES;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner
{
     NSLog(@"AsiAds : iAdsDelegate :: bannerViewActionDidFinish");
     dispatchEvent(kAsiAdsEventBannerActionDidFinish);
}

@end


extern "C"
{
	static ADBannerView *adBanner=nil;
	static iAdsDelegate *adDelegate=nil;
	extern "C" void asiads_send_event(int eventId);

	void Init()
	{
		NSLog(@"asiAds : Init()");

		//Create our ad view delegate object
		adDelegate = [[iAdsDelegate alloc]init];

		//Setup iAds
	    adBanner = [[ADBannerView alloc]initWithAdType:ADAdTypeBanner];
	    adBanner.delegate = adDelegate;

	    //Ad banner to footer
	    CGRect screenRect = [[UIScreen mainScreen] bounds];

	    CGRect bannerRect = adBanner.frame;
	    adBanner.frame = CGRectMake(0,screenRect.size.height - bannerRect.size.height,bannerRect.size.width,bannerRect.size.height);

	    [[[[UIApplication sharedApplication] keyWindow] rootViewController].view addSubview: adBanner];

	    //Initially hidden. Should wait until we receive an ad before displaying it
	    adBanner.hidden = YES;
	}

	void RemoveAd()
	{
		if(adBanner!=nil)
			[adBanner removeFromSuperview];
	}

	void ShowAd()
	{
		if(adBanner!=nil)
			adBanner.hidden = NO;
	}

	void HideAd()
	{
		if(adBanner!=nil)
			adBanner.hidden = YES;
	}

	void dispatchEvent(int eventId)
	{
		NSLog(@"asiAds : dispatchEvent(%i)",eventId);
		asiads_send_event(eventId);
	}
}

