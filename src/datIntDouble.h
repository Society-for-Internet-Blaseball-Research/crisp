#ifndef _datIntDouble_
#define _datIntDouble_

#include <rw/collect.h>
#include <rw/tvvector.h>
#include "datTypes.h"

class datIntDouble : public RWCollectable {

  protected:

  	RWTValVector<double> dvec;
	RWTValVector<int> ivec;
	int _lock;

  public:

	  datIntDouble(int is, int ds) : _lock(0) {
		ivec.reshape(is);
		dvec.reshape(ds);
	}
	
	virtual RWClassID isA() const;
	virtual int compareTo(const RWCollectable *) const;
	virtual int getInt(int i) const
		{if(i>=0 && i<(int)ivec.length())return ivec[i];return 0;}
	double getDouble(int i) {return dvec[i];}
	virtual void setInt(int i, int val)
		{ if(i>=0 && i<(int)ivec.length())ivec[i] = val; }
	void setDouble(int i, double val, int delta=0); 
	virtual int itemsInt(void) const { return ivec.length(); } 
	int lock(int i=-1){ 
		if(i == -1) return _lock;
		_lock = i;
		return _lock;
	}
};

#endif
