asiads
======

iAds for OpenFL (iPhone + iPad)

h3. Methods:

//Create and attach iAd to main window but initially set to hidden
AsiAds.Init();

//Display the ad (wait until you receive AsiAdsEvent.LOAD_COMPLETE event though)
AsiAds.ShowAd();

//Temporarily hides the ad   
AsiAds.HideAd();  

//Remove the ad completely (ie. In-app purchase removed adverts)
AsiAds.RemoveAd();

h3. Events:

* AsiAdsEvent.ACTION_START  
* AsiAdsEvent.ACTION_END  
* AsiAdsEvent.LOAD_ERROR  
* AsiAdsEvent.LOAD_COMPLETE  
  
  
ie.  
AsiAds.dispatch.addEventListener(AsiAdsEvent.LOAD_COMPLETE,showMyAds);  

public function showMyAds(evt:Event)  
{  
	AsiAds.ShowAd();  
}  

h3. Installation:

**sudo bash install.sh**  

(make sure you are cd into install.sh parent folder first)