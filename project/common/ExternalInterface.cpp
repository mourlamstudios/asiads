
#include <hx/CFFI.h>
#include <hxcpp.h>
#include "asiAds.h"
	
#define NULL_VAL null()
	
DEFINE_ENTRY_POINT(asiads_main);
	
using namespace asiads;

AutoGCRoot *asiadsEventCallback=0;

static value asiads_init(value onEvent)
{
	printf("asiads: asiads_init\n");
	asiadsEventCallback=new AutoGCRoot(onEvent);

	Init();

	return alloc_null();
}
DEFINE_PRIM(asiads_init,1);

value asiads_showad()
{
	ShowAd();
	return alloc_null();
}
DEFINE_PRIM(asiads_showad,0);

value asiads_hidead()
{
	HideAd();
	return alloc_null();
}
DEFINE_PRIM(asiads_hidead,0);

value asiads_removead()
{
	RemoveAd();
	return alloc_null();
}
DEFINE_PRIM(asiads_removead,0);

extern "C" 
{
	int asiads_register_prims()
	{
		printf("CPP: asiads_register_prims()\n");
		return 0;
	}

	void asiads_send_event(int eventId)
	{
		printf("asiads Send Event: %i\n",eventId);
		val_call1(asiadsEventCallback->get(),alloc_int(eventId));
	}
}