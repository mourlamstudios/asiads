#ifndef __ASIADS_H
#define __ASIADS_H

namespace asiads 
{
	extern "C"
	{
		void Init();
		void HideAd();
		void RemoveAd();
		void ShowAd();
		void dispatchEvent(int eventId);
	}
}

#endif